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

<div class="about-actions" aria-label="Profile links">
  <a class="about-action" href="https://github.com/asjad99" target="_blank" rel="noopener noreferrer">
    <i class="fa-brands fa-github" aria-hidden="true"></i> GitHub
  </a>
  <a class="about-action" href="https://x.com/asjad_99" target="_blank" rel="noopener noreferrer">
    <i class="fa-brands fa-x-twitter" aria-hidden="true"></i> Twitter
  </a>
  <a class="about-action about-action--resume" href="{{ '/assets/pdf/Asjad - Resume SE Role UNSW.pdf' | relative_url }}" download="Asjad - Resume SE Role UNSW.pdf">
    <i class="fa-solid fa-file-arrow-down" aria-hidden="true"></i> Download Resume
  </a>
</div>

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

  .services-section {
    clear: both;
    margin: 3rem 0;
  }

  .about-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    margin: 2rem 0 3rem;
  }

  .about-action {
    display: inline-flex;
    align-items: center;
    gap: 0.6rem;
    min-height: 3.25rem;
    padding: 0.75rem 1.35rem;
    border: 2px solid var(--global-theme-color);
    border-radius: 0.9rem;
    color: var(--global-theme-color);
    font-size: 1.2rem;
    font-weight: 500;
    text-decoration: none;
  }

  .about-action:hover {
    color: var(--global-hover-color);
    text-decoration: none;
  }

  .about-action--resume {
    color: #fff;
    background: var(--global-theme-color);
  }

  .about-action--resume:hover {
    color: #fff;
    background: var(--global-hover-color);
  }

  .services-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1.5rem;
    margin-top: 2rem;
  }

  .service-card {
    box-sizing: border-box;
    min-height: 25rem;
    padding: 2.5rem;
    overflow-wrap: anywhere;
    border: 1px solid var(--global-divider-color);
    border-radius: 1.25rem;
    background: var(--global-bg-color);
  }

  .service-card h3 {
    margin: 0 0 1.25rem;
    color: var(--global-text-color);
    font-family: Georgia, "Times New Roman", serif;
    font-size: 1.7rem;
  }

  .service-card p {
    margin-bottom: 1.5rem;
    color: var(--global-text-color-light);
    font-size: 1.15rem;
    line-height: 1.8;
  }

  .service-card ul {
    margin: 0;
    padding-left: 1.5rem;
    color: var(--global-text-color-light);
    font-size: 1.05rem;
  }

  .service-card li {
    margin-bottom: 0.75rem;
  }

  @media (max-width: 992px) {
    .clients-grid,
    .services-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .service-card {
      padding: 1.75rem;
    }
  }

  @media (max-width: 576px) {
    .clients-grid,
    .services-grid {
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

<section class="services-section">
  <h2>Services</h2>
  <p class="lead">Leveraging AI and web technologies to build innovative solutions that drive business value.</p>
  <div class="services-grid">
    {% for service in site.data.services %}
      <div class="service-card">
        <h3>{{ service.name }}</h3>
        <p>{{ service.description }}</p>
        <ul>
          {% for offering in service.offerings %}
            <li>{{ offering }}</li>
          {% endfor %}
        </ul>
      </div>
    {% endfor %}
  </div>
</section>
