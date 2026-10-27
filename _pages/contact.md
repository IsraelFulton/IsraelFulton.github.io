---
title: "Contact"
permalink: /contact/
excerpt: "Reach Israel Fulton by email, or connect on X, LinkedIn, GitHub, and Substack."
---

The best way to reach me is by email: [{{ site.email }}](mailto:{{ site.email }}).

I'm glad to compare notes on economics, policy, analytical tools, or a potential collaboration. You can also find me here:

{% assign profile = site.data.authors[site.author] %}
{% for link in profile.links %}
{% unless link.url contains 'mailto:' %}
- [{{ link.label }}]({{ link.url }})
{% endunless %}
{% endfor %}
