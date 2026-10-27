---
layout: single
title: "Economics, institutions, and technology."
excerpt: "I'm Israel Fulton, an analyst at Analysis Group in Washington, D.C. I study how markets and institutions shape decisions."
author_profile: true
classes: homepage
---

<p class="intro">I'm Israel Fulton, an analyst at <a href="https://www.analysisgroup.com/">Analysis Group</a> in Washington, D.C. I'm interested in how markets and institutions shape decisions, and what careful analysis can tell us about them.</p>

I work and write about economics, international affairs, artificial intelligence, climate, and energy. This site brings together my analytical projects, research, and essays.

[More about me]({{ '/about/' | relative_url }}) · [Get in touch]({{ '/contact/' | relative_url }})

## Selected projects

<div class="project-grid">
{% assign selected_projects = site.projects | where: "featured", true | sort: "order" %}
{% for project in selected_projects %}
  {% include project-card.html project=project %}
{% endfor %}
</div>

[Explore the projects]({{ '/projects/' | relative_url }})

## Selected writing

{% include writing-list.html limit=2 %}

[All writing and research notes]({{ '/writing/' | relative_url }}) · [Limiting Factors on Substack](https://limitingfactors.substack.com)
