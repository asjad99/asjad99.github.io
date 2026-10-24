---
layout: page
title: "Bookmarks"
permalink: /knowledge-base/bookmarks/
description: Links I want to keep and come back to.
---

<p><em>Saved links, newest first. <a href="/knowledge-base/">← Back to Knowledge Base</a></em></p>

{%- assign bms = site.data.bookmarks -%}
{%- assign alltags = "" | split: "" -%}
{%- for b in bms -%}{%- assign alltags = alltags | concat: b.tags -%}{%- endfor -%}
{%- assign alltags = alltags | uniq | sort -%}

<div class="bm-tools">
<input id="bm-q" type="search" placeholder="Search bookmarks" aria-label="Search bookmarks">
<div class="bm-chips"><button class="bm-chip is-on" data-tag="">All</button>{%- for t in alltags -%}<button class="bm-chip" data-tag="{{ t }}">{{ t }}</button>{%- endfor -%}</div>
</div>

<div class="bm-grid" id="bm-all">
{%- for b in bms -%}
<a class="bm-card" href="{{ b.url }}" target="_blank" rel="noopener" data-tags="{{ b.tags | join: ' ' }}">
  <div class="bm-thumb">{%- if b.image and b.image != "" -%}<img src="{{ b.image }}" alt="" loading="lazy" referrerpolicy="no-referrer" onerror="this.remove()">{%- endif -%}<span>{{ b.site | slice: 0 | upcase }}</span></div>
  <div class="bm-body"><div class="bm-site">{{ b.site }}</div><div class="bm-title">{{ b.title }}</div><p class="bm-summary">{{ b.summary }}</p><div class="bm-meta">{{ b.added | date: "%-d %b %Y" }}{%- for t in b.tags %} · {{ t }}{% endfor -%}</div></div>
</a>
{%- endfor -%}
</div>
<p id="bm-none" hidden>No bookmarks match.</p>

<script>
(()=>{const q=document.getElementById('bm-q'),cards=[...document.querySelectorAll('#bm-all .bm-card')],chips=[...document.querySelectorAll('.bm-chip')],none=document.getElementById('bm-none');let tag='';
const run=()=>{const s=q.value.trim().toLowerCase();let n=0;cards.forEach(c=>{const ok=(!tag||c.dataset.tags.split(' ').includes(tag))&&(!s||c.textContent.toLowerCase().includes(s));c.hidden=!ok;if(ok)n++});none.hidden=n>0};
q.addEventListener('input',run);chips.forEach(b=>b.addEventListener('click',()=>{chips.forEach(x=>x.classList.remove('is-on'));b.classList.add('is-on');tag=b.dataset.tag;run()}));})();
</script>
