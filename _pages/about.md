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

<style>
  .clients-employment {
    clear: both;
    margin: 3rem 0;
  }

  .clients-grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 1rem;
    margin-top: 2rem;
  }

  .client-card {
    box-sizing: border-box;
    min-height: 12rem;
    padding: 1.5rem;
    overflow-wrap: anywhere;
    text-align: center;
    background: var(--global-code-bg-color);
    border-radius: 0.75rem;
  }

  .client-card h3 {
    margin: 0 0 0.75rem;
    font-size: 1.2rem;
  }

  .client-card p {
    margin-bottom: 0.75rem;
    font-size: 0.95rem;
  }

  @media (max-width: 992px) {
    .clients-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 576px) {
    .clients-grid {
      grid-template-columns: 1fr;
    }
  }
</style>

<section class="clients-employment">
  <h2>Clients / Employment</h2>
  <p class="lead">I've had the pleasure of working with amazing companies and institutions across various industries.</p>
  <div class="clients-grid">
    {% for client in site.data.clients %}
      <div class="client-card">
        <h3>{{ client.name }}</h3>
        <p><strong>{{ client.role }}</strong></p>
        <p>{{ client.description }}</p>
      </div>
    {% endfor %}
  </div>
</section>
