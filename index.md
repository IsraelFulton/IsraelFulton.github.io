---
layout: single
title: "Economics, institutions, and technology"
excerpt: "Israel Fulton is an analyst at Analysis Group in Washington, D.C. Explore his research and writing on economics, artificial intelligence, and institutions."
author_profile: true
classes: homepage
---

<p class="intro">I’m Israel Fulton, an analyst at <a href="https://www.analysisgroup.com/">Analysis Group</a> in Washington, D.C. I'm interested in how markets, institutions, and technology shape decisions, and what careful analysis can tell us about them.</p>

I built a tool so staff at an after-school program could [match survey responses across school years]({{ '/projects/matching-survey-responses/' | relative_url }}) on their own. In my independent research, I [tracked resale prices across 632 U.S. concerts]({{ '/projects/seatdata/' | relative_url }}) to see whether buyers could count on a last-minute discount.

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
