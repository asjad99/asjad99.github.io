---
layout: page
title: Projects
permalink: /projects/
nav: true
nav_order: 3
---

<p class="projects-intro">Selected data, AI, and software projects spanning research and production systems.</p>

<div class="projects-list">
  {% for project in site.data.projects %}
    <article class="project-card">
      <a class="project-thumbnail" href="{{ project.url | relative_url }}">
        <img src="{{ project.image | relative_url }}" alt="{{ project.title }} thumbnail" loading="lazy">
      </a>
      <div class="project-card-content">
        <h2><a href="{{ project.url | relative_url }}">{{ project.title }}</a></h2>
        <p>{{ project.description }}</p>
      </div>
    </article>
  {% endfor %}
</div>

<style>
  .projects-intro {
    margin: 1.5rem 0 2.5rem;
    font-size: 1.25rem;
  }

  .projects-list {
    display: flex;
    flex-direction: column;
    gap: 1.25rem;
  }

  .project-card {
    display: grid;
    grid-template-columns: 13rem minmax(0, 1fr);
    gap: 1.5rem;
    align-items: center;
    padding: 1.25rem;
    border: 1px solid var(--global-divider-color);
    border-radius: 0.9rem;
    background: var(--global-bg-color);
  }

  .project-thumbnail {
    display: block;
    width: 13rem;
    height: 10rem;
    overflow: hidden;
    border-radius: 0.6rem;
  }

  .project-thumbnail img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .project-card-content h2 {
    margin: 0 0 0.75rem;
    font-size: 1.45rem;
  }

  .project-card-content h2 a {
    color: var(--global-text-color);
  }

  .project-card-content p {
    margin: 0;
    color: var(--global-text-color-light);
    line-height: 1.65;
  }

  @media (max-width: 576px) {
    .project-card {
      grid-template-columns: 1fr;
    }

    .project-thumbnail {
      width: 100%;
      height: 12rem;
    }
  }
</style>
