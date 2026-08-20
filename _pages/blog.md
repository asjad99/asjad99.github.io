---
layout: page
permalink: /blog-posts/
title: "Notes by Asjad"
nav: true
nav_order: 1
---

<p class="blog-intro">Essays, tutorials, and working notes on data, AI, and software.</p>

<div class="blog-index">
  <h2>Machine Learning and Data Mining</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains 'Machine Learning'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  <h2>Reinforcement Learning</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains 'Sequential Decision Making'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  <h2>Process Improvement and Decision Support</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains 'Process Improvement and Decision Support'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  <h2>Data Analysis and Data Engineering</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains 'data engineering' or post.tags contains 'Advanced data algorithms'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  <h2>Software Engineering and Systems</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains '#SE' or post.tags contains 'programming languages'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>

  <h2>Essays and Perspectives</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains '#blog'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
</div>

<style>
  .blog-intro {
    font-size: 1.35rem;
    margin: 2rem 0 3rem;
  }

  .blog-index {
    border-top: 1px solid var(--global-divider-color);
    padding-top: 1.5rem;
  }

  .blog-index h2 {
    font-size: 1.5rem;
    margin: 2rem 0 1rem;
  }

  .blog-index ul {
    margin: 0 0 2rem;
  }

  .blog-index li {
    margin-bottom: 0.45rem;
    padding-left: 0.2rem;
    font-size: 1.15rem;
  }

  .blog-index a {
    color: var(--global-theme-color);
  }
</style>
