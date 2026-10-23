---
layout: page
title: Bookshelf
permalink: /books/
nav: true
description: Books on my shelf, grouped by topic.
---

{% assign shelves = "philosophy|Philosophy;health|Health Optimization;business|Business;investing|Investing;history|History, Science & Biography;data-ai|Data & AI" | split: ";" %}
{% assign all_books = site.books | sort: "order" %}

{% for s in shelves %}
{% assign parts = s | split: "|" %}
{% assign key = parts[0] %}
{% assign books = all_books | where: "shelf", key %}
{% if books.size > 0 %}

<h2 id="{{ key }}">{{ parts[1] }}</h2>

<div class="shelf-grid">
  {% for b in books %}
    <figure class="shelf-book">
      {% if b.cover %}
        <img src="{{ b.cover | relative_url }}" alt="{{ b.title }} cover" loading="lazy">
      {% else %}
        <div class="shelf-placeholder"><span>{{ b.title }}</span></div>
      {% endif %}
      <figcaption>
        <span class="shelf-title">{{ b.title }}</span>
        {% if b.author and b.author != "" %}<span class="shelf-author">{{ b.author }}</span>{% endif %}
        {% if b.status == "planned" %}<span class="shelf-tag">Reading in 2026</span>{% endif %}
      </figcaption>
    </figure>
  {% endfor %}
</div>
{% endif %}
{% endfor %}

<style>
  .shelf-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
    gap: 1.5rem 1.25rem;
    margin: 1rem 0 2.5rem;
  }
  .shelf-book {
    margin: 0;
  }
  .shelf-book img,
  .shelf-placeholder {
    width: 100%;
    aspect-ratio: 2 / 3;
    object-fit: contain;
    background: #f4f4f4;
    border: 1px solid var(--global-divider-color);
    display: block;
  }
  .shelf-placeholder {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0.75rem;
    text-align: center;
    background: #f4f4f4;
    border-top: 4px solid var(--global-theme-color);
    font-weight: 600;
    font-size: 0.9rem;
    line-height: 1.25;
  }
  .shelf-book figcaption {
    margin-top: 0.5rem;
    line-height: 1.3;
  }
  .shelf-title {
    display: block;
    font-weight: 600;
    font-size: 0.9rem;
  }
  .shelf-author,
  .shelf-tag {
    display: block;
    font-size: 0.78rem;
    color: var(--global-text-color-light);
  }
  .shelf-tag {
    color: var(--global-theme-color);
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-size: 0.68rem;
    margin-top: 0.15rem;
  }
</style>
