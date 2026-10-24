---
layout: page
title: "Knowledge Base"
permalink: /knowledge-base/
nav: true
nav_order: 7
description: Essays, tutorials and e-books built from my research notes with AI assistance.
---

<p><em>Everything here grows out of a personal research wiki that an AI helps me build and maintain: sources go in, the AI compiles linked notes, and the best answers become essays, tutorials and books. I review everything before it is published.</em></p>

## Bookmarks

Links I want to keep and come back to. [See all bookmarks →](/knowledge-base/bookmarks/)

<div class="bm-grid">
{%- assign bms = site.data.bookmarks -%}
{%- for b in bms limit: 6 -%}
<a class="bm-card" href="{{ b.url }}" target="_blank" rel="noopener">
  <div class="bm-thumb">{%- if b.image and b.image != "" -%}<img src="{{ b.image }}" alt="" loading="lazy" referrerpolicy="no-referrer" onerror="this.remove()">{%- endif -%}<span>{{ b.site | slice: 0 | upcase }}</span></div>
  <div class="bm-body"><div class="bm-site">{{ b.site }}</div><div class="bm-title">{{ b.title }}</div><p class="bm-summary">{{ b.summary }}</p><div class="bm-meta">{{ b.added | date: "%-d %b %Y" }}</div></div>
</a>
{%- endfor -%}
</div>

## Blog Posts

- [The Receipt for a Computation](/knowledge-base/succinct/): how Succinct makes zero-knowledge proofs practical, and why a "receipt" for a computation matters. _October 2026_
- [Reading the Whole Letter](/knowledge-base/orchid/): what Orchid's whole-genome embryo screening can and can't tell parents. _October 2026_
{: .econ-list}

## Missing Semester

Practical tools that school rarely teaches, named after MIT's [Missing Semester](https://missing.csail.mit.edu/) course.

- [Top 10 Git Commands](/knowledge-base/git-commands/): save, share and undo your work with Git and GitHub, from first setup to testing a pull request. _October 2026_
- [Top 10 Terminal Commands](/knowledge-base/terminal-commands/): move around, install tools, run projects, free stuck ports and keep secrets out of your history. _October 2026_
- [Zed Editor Tips (Sublime Keys)](/knowledge-base/zed-editor-tips/): the shortcuts and habits that make Zed fast, using Sublime Text key bindings: multiple cursors, search, navigation, panels and Git. _October 2026_
{: .econ-list}

## Keeping up with AI Progress

- [AI Capability Comparison](/knowledge-base/ai-capability-comparison/): the leaderboards, people and newsletters I use to track new models, and how to read a leaderboard without being fooled. _October 2026_
{: .econ-list}

## E-books

### Mini-Books

These are based on my old learning notes that I am slowly converting into mini-books with help of Codex.

- [Dynamic Decision Making and Reinforcement Learning](https://asjad99.github.io/ddm-mini-book/)
- [Big Ideas in Deep Learning](https://asjad99.github.io/big-ideas-in-deep-learning/#relational-reasoning-and-graph-message-passing)
- [Software Engineering](https://asjad99.github.io/software-engineering-handbook/)
- [MLOps: Best practices for designing scalable and reliable machine learning systems](https://asjad99.github.io/mlops-handbook/)
{: .econ-list}
