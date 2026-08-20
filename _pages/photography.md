---
layout: page
title: Travel
permalink: /photography/
nav: true
nav_order: 6
---

<p class="travel-intro">Photographs and memories from places I've visited.</p>

<div class="travel-page">
  {% for destination in site.data.travel %}
    <section class="travel-country">
      <h2>{{ destination.country }}</h2>
      <div class="travel-gallery">
        {% for photo in destination.images %}
          <a class="travel-photo" href="{{ photo.image | relative_url }}" data-zoomable>
            <img src="{{ photo.image | relative_url }}" alt="{{ photo.alt }}" loading="lazy">
          </a>
        {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>

<style>
  .travel-intro {
    margin: 1.5rem 0 2.5rem;
    font-size: 1.25rem;
  }

  .travel-country {
    margin: 3rem 0;
  }

  .travel-country h2 {
    margin-bottom: 1.25rem;
  }

  .travel-gallery {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 0.9rem;
  }

  .travel-photo {
    display: block;
    aspect-ratio: 4 / 3;
    overflow: hidden;
    border-radius: 0.6rem;
    background: var(--global-code-bg-color);
  }

  .travel-photo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 180ms ease;
  }

  .travel-photo:hover img {
    transform: scale(1.03);
  }

  @media (max-width: 768px) {
    .travel-gallery {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 480px) {
    .travel-gallery {
      grid-template-columns: 1fr;
    }
  }
</style>
