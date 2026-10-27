# IsraelFulton.github.io

Personal homepage at **https://israelfulton.com**, built with Jekyll, GitHub Pages, and Minimal Mistakes **4.24.0**, using the existing dark skin. `CNAME` and the canonical domain stay unchanged. No framework or deployment migration is required.

## Local build and review

Use Ruby 3.3 and Bundler 2.6.9 (the lockfile's version):

```sh
bundle install
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
bundle exec ruby script/check-site.rb
bundle exec jekyll serve
```

The remote theme requires internet access during the build. `Gemfile` targets GitHub Pages 232, matching its supported Jekyll 3.10 dependency set. Build dependencies are documented at https://pages.github.com/versions/.

The check script inspects generated HTML for broken local links and fragments, missing assets, metadata, heading structure, contact consistency, preserved routes, and accidental publication of authoring files. External services may block automated requests; review those links separately.

Build and preview the proposed branch before merging. The existing GitHub Pages deployment remains controlled by the repository's current settings; no deployment workflow is added here.

## Content structure

- `index.md`: introduction and selected projects/writing; no automatic recent-post archive.
- `_pages/`: About, Projects, Writing, and Contact; included as standalone pages so they have no synthetic publication dates or post pagination. Existing URLs are preserved.
- `_projects/`: case studies, rendered by `_layouts/project.html`.
- `_includes/project-card.html`: shared card used on the homepage and Projects page.
- `_data/writing.yml`: curated external essays/publications with real publication dates.
- `_posts/`: local posts. The original June 2025 introduction remains at `/meta/hello-world/`, labeled as an archive item.
- `_data/authors.yml`: public profile and social links; `_config.yml` holds the primary email and canonical identity.
- `assets/css/main.scss`: small overrides after the original theme imports.

### Add a project

Copy `_templates/project-case-study.md` into `_projects/<slug>.md`. Replace every bracketed placeholder with verified content and set `published: true` only when ready. Set `featured: true` for homepage inclusion and use `order` to control display. The project URL is `/projects/<filename>/`.

Set `date` to the actual case-study publication date so it stays stable between builds. Write the question, your role, method, evidence, and limitations. State draft or preliminary status in `status` and use `review_note` when substantive material is missing. Do not imply completed outcomes, publication, or peer review. Client identities, confidential work, private repository URLs, licensed raw records, and unapproved manuscripts do not belong in the site source or output.

The SeatData and First Amendment overviews use verified source material; missing figures, downloadable papers, and full methods discussions are explicitly labeled draft placeholders. No private datasets or manuscripts are copied into the repository.

### Add writing or notes

Add a verified public link, exact title, publication date, publication name, kind, and concise description to `_data/writing.yml`. The same entries supply the homepage and Writing page. Keep preferred entries first; the homepage shows the first two. Other publications can use the same format.

For a local essay or research note, add a Markdown post in `_posts/` with a title, date, excerpt, and optional `kind: research-note`. The Notes section appears only when an entry exists. Use `kind: site-note` for housekeeping posts to keep them out of the selected work.

## Review boundaries

This branch is prepared for review, not deployment. Research descriptions and editorial choices should be reviewed before merging. The website makes no new claim about consulting clients, validated ticket-buying performance, or a published First Amendment manuscript.
