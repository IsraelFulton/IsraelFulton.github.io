---
title: "Projects"
permalink: /projects/
excerpt: "Selected analytical projects and research, with the questions, methods, and limitations behind each."
---

Research and analytical projects, from concert resale markets to campaign finance. Each case study explains the question, the approach, and what the evidence can support.

<div class="project-grid">
{% assign projects = site.projects | sort: "order" %}
{% for project in projects %}
  {% include project-card.html project=project %}
{% endfor %}
</div>

These are independent projects. My professional work is described at a general level on the [About page]({{ '/about/' | relative_url }}); client work and confidential materials are not included here.

For related essays, visit [Writing]({{ '/writing/' | relative_url }}). To discuss a question or method, [get in touch]({{ '/contact/' | relative_url }}).
