---
title: "Projects"
permalink: /projects/
excerpt: "My work on concert resale markets, political information, and the institutions that shape decisions."
---

An expiring concert ticket and a corporate political ad both raise questions about information and incentives. In these projects, I follow those questions through resale-market data, an election model, and the rules that shape what people know when they make decisions.

<div class="project-grid">
{% assign projects = site.projects | sort: "order" %}
{% for project in projects %}
  {% include project-card.html project=project %}
{% endfor %}
</div>

For related essays, visit [Writing]({{ '/writing/' | relative_url }}). If you've worked on a similar question, I'd be glad to [compare notes]({{ '/contact/' | relative_url }}).
