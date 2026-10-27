# Run after jekyll build. Nokogiri is already a GitHub Pages dependency.
require "nokogiri"
require "pathname"
require "uri"
require "json"
require "yaml"

root = Pathname.new(ARGV.fetch(0, "_site")).expand_path
abort "Build the site first: #{root} is missing" unless root.directory?
config = YAML.load_file("_config.yml")
author = YAML.load_file("_data/authors.yml").fetch(config.fetch("author"))
canonical_origin = URI(config.fetch("url"))
errors = []
files = root.glob("**/*.html")
pages = files.to_h { |file| [file, Nokogiri::HTML(file.read)] }

%w[index.html about/index.html projects/index.html writing/index.html contact/index.html meta/hello-world/index.html projects/seatdata/index.html projects/first-amendment/index.html 404.html].each do |path|
  errors << "Missing preserved or expected route: #{path}" unless (root + path).file?
end

pages.each do |file, doc|
  label = file.relative_path_from(root)
  errors << "#{label}: expected one h1" unless doc.css("h1").size == 1
  errors << "#{label}: missing title" if doc.at_css("title")&.text.to_s.strip.empty?
  %w[description twitter:card twitter:site].each do |name|
    errors << "#{label}: missing #{name}" if doc.at_css("meta[name='#{name}']")&.[]("content").to_s.strip.empty?
  end
  %w[og:title og:description og:image].each do |name|
    errors << "#{label}: missing #{name}" if doc.at_css("meta[property='#{name}']")&.[]("content").to_s.strip.empty?
  end
  route = "/" + label.to_s.sub(/index\.html$/, "")
  expected_canonical = config.fetch("url") + route
  errors << "#{label}: wrong canonical URL" unless doc.at_css("link[rel='canonical']")&.[]("href") == expected_canonical
  doc.css("script[type='application/ld+json']").each do |script|
    identity = JSON.parse(script.text)
    errors << "#{label}: missing structured-data name" if identity["name"].to_s.empty?
  rescue JSON::ParserError
    errors << "#{label}: invalid structured data"
  end
  ids = doc.css("[id]").map { |node| node["id"] }
  errors << "#{label}: duplicate IDs" unless ids.uniq == ids
  doc.css("img").each { |img| errors << "#{label}: image needs alt" if img["alt"].nil? }
  doc.css("a[href], img[src], script[src], link[href]").each do |node|
    ref = node["href"] || node["src"]
    next if ref.nil? || ref.empty?
    if ref.start_with?("mailto:")
      errors << "#{label}: inconsistent email #{ref}" unless ref == "mailto:#{config.fetch('email')}"
      next
    end
    uri = URI.parse(ref)
    next if uri.scheme && !%w[http https].include?(uri.scheme)
    next if uri.host && uri.host != canonical_origin.host
    path = URI::DEFAULT_PARSER.unescape(uri.path.to_s)
    target = if path.empty?
      file
    elsif path.start_with?("/")
      root + path.delete_prefix("/")
    else
      file.dirname + path
    end.cleanpath
    target += "index.html" if target.directory?
    errors << "#{label}: missing local target #{ref}" unless target.file?
    if uri.fragment && !uri.fragment.empty? && pages.key?(target)
      fragment = URI::DEFAULT_PARSER.unescape(uri.fragment)
      errors << "#{label}: missing fragment #{ref}" unless pages[target].css("[id]").any? { |item| item['id'] == fragment }
    end
  rescue URI::InvalidURIError
    errors << "#{label}: invalid URL #{ref}"
  end
end

%w[index.html about/index.html projects/index.html writing/index.html contact/index.html].each do |path|
  doc = pages[root + path]
  errors << "#{path}: standalone page has a synthetic article date" if doc&.at_css("meta[property='article:published_time']")
  errors << "#{path}: unexpected post pagination" if doc&.at_css("nav.pagination")
end
# Editorial requirements apply through shared templates on every page.
pages.each do |file, doc|
  label = file.relative_path_from(root)
  errors << "#{label}: repeated navigation tagline" if doc.at_css(".site-subtitle")
  errors << "#{label}: repeated sidebar tagline" if doc.at_css(".author__bio")
end
%w[projects/seatdata/index.html projects/first-amendment/index.html].each do |path|
  doc = pages[root + path]
  errors << "#{path}: visible project timestamp" if doc&.at_css(".page__date")
  errors << "#{path}: public drafting scaffolding" if doc&.text&.match?(/Draft for review|Draft placeholder|what .*should.*be added/i)
end
post = pages[root + "meta/hello-world/index.html"]
errors << "Original post lost its visible publication date" unless post&.css("time")&.any? { |time| time["datetime"].to_s.start_with?("2025-06-21") }
homepage = pages[root + "index.html"]
errors << "Homepage headline changed" unless homepage&.at_css("h1")&.text&.strip == "Economics, institutions, and technology."
errors << "Introductory post is featured as recent work" if homepage&.text&.match?(/Hello, World!|Recent Posts/)
errors << "Stale coming-soon copy" if pages.values.any? { |doc| doc.text.match?(/coming soon/i) }
%w[README.md Gemfile Gemfile.lock script/check-site.rb _templates/project-case-study.md docs/].each do |path|
  errors << "Authoring file was published: #{path}" if (root + path).exist?
end
errors << "CNAME changed" unless (root + "CNAME").read.strip == "israelfulton.com"
errors << "Author profile is missing" unless author.fetch("name") == "Israel Fulton"

abort errors.join("\n") unless errors.empty?
puts "PASS: #{files.size} HTML pages; routes, local links/fragments, assets, metadata, contact consistency, and publishing boundaries."
