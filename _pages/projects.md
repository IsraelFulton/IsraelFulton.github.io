---
title: "Projects"
permalink: /projects/
excerpt: "My pro bono work with an after-school program and my research on concert ticket prices and campaign finance."
---

I’m interested in how people make decisions with incomplete information. For staff at an after-school program, that meant knowing when to link two survey records and when to take a closer look. In my research, I’ve tested the advice to wait for cheaper concert tickets and asked what voters should know about the money behind a political ad.

<div class="project-grid">
{% assign projects = site.projects | sort: "order" %}
{% for project in projects %}
  {% include project-card.html project=project %}
{% endfor %}
</div>

For related essays, visit [Writing]({{ '/writing/' | relative_url }}). If you've worked on a similar question, I'd be glad to [compare notes]({{ '/contact/' | relative_url }}).
