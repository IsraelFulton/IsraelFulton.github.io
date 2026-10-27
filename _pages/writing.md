---
title: "Writing"
permalink: /writing/
excerpt: "Selected essays from Limiting Factors, alongside research and notes on economics, institutions, and technology."
---

I write about economics, international affairs, artificial intelligence, climate, and energy. A recurring question is how institutions shape the information people use to make decisions.

## Selected essays

Longer essays appear in [Limiting Factors](https://limitingfactors.substack.com), my newsletter on Substack.

{% include writing-list.html %}

[Browse the newsletter archive](https://limitingfactors.substack.com/archive)

## Research

- [Do Concert Tickets Get Cheaper Before Showtime?]({{ '/projects/seatdata/' | relative_url }}) — repeated price observations, variation between shows, and a prediction that weakened in another sample.
- [Truthful Representation]({{ '/projects/first-amendment/' | relative_url }}) — an argument about political information, corporate spending, and the rules of representation.

{% assign notes = site.posts | where_exp: "post", "post.kind != 'site-note'" %}
{% if notes.size > 0 %}
## Notes

{% for post in notes %}
- [{{ post.title }}]({{ post.url | relative_url }}) — {{ post.date | date: "%B %-d, %Y" }}
{% endfor %}
{% endif %}

<details class="archive-note">
  <summary>From the site archive</summary>
  <p><a href="{{ '/meta/hello-world/' | relative_url }}">Hello, World!</a> — June 21, 2025. The original site introduction.</p>
</details>
