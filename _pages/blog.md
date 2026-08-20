---
layout: page
permalink: /blog-posts/
title: "Blog"
nav: true
nav_order: 1
---

<div class="blog-index">
  <h2>Essays and Perspectives</h2>
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.tags contains '#blog'" %}
    {% for post in posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
</div>

<style>
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
