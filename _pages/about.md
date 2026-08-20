---
layout: about
title: About
permalink: /
subtitle: Data scientist, researcher, and builder

profile:
  align: right
  image: my_photo.png
  image_circular: false
  more_info: >
    <p>Australia</p>

selected_papers: false
social: true

announcements:
  enabled: true
  scrollable: true
  limit: 5

latest_posts:
  enabled: true
  scrollable: true
  limit: 3
---

I am Asjad Khan, a data scientist and researcher interested in the intersection of artificial intelligence, data engineering, and software engineering. I work on practical systems that turn data and intelligent algorithms into better decisions.

This site collects my research, projects, essays, tutorials, and notes. The archive includes work on process mining, machine learning, reinforcement learning, healthcare decision support, data products, and the broader implications of AI.

For a current overview of my work and experience, see the [CV]({{ '/cv/' | relative_url }}), [research]({{ '/my-research/' | relative_url }}), and [projects]({{ '/projects/' | relative_url }}) pages.

<section class="my-5">
  <h2>Clients / Employment</h2>
  <p class="lead">I've had the pleasure of working with amazing companies and institutions across various industries.</p>
  <div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
    {% for client in site.data.clients %}
      <article class="rounded-xl bg-gray-50 p-6 text-center shadow-sm dark:bg-gray-800">
        <h3 class="mb-3 text-xl font-semibold">{{ client.name }}</h3>
        <p class="mb-3 font-medium">{{ client.role }}</p>
        <p class="mb-0">{{ client.description }}</p>
      </article>
    {% endfor %}
  </div>
</section>
