# Knowledge Base — how it works

This folder is an LLM-maintained research wiki. Open `_knowledge/` as a vault in Obsidian to browse it.
Jekyll ignores it (folders starting with `_` are not published), so nothing here goes on the website
until it is turned into a page under `_pages/knowledge-base*.md`.

**Rule:** the LLM writes and maintains everything in `wiki/`, `index.md` and `log.md`. Asjad rarely edits them by hand.
Asjad adds sources to `raw/` and asks questions.

## Layout

```
_knowledge/
  README.md        this file: the workflow contract
  index.md         master index: every wiki article with a one-line summary (LLM keeps it current)
  log.md           append-only log of ingests, queries, outputs and lint runs
  raw/             source material, one file per source (clipped articles, papers, transcripts, images)
    sources.md     register of every source: id, title, URL, date added, wiki pages that use it
    assets/        images downloaded for sources
  wiki/
    concepts/      one article per idea (e.g. zero-knowledge-proofs.md)
    entities/      companies, people, products (e.g. succinct.md)
    topics/        overview articles that tie concepts together
  outputs/         answers, essays, Marp slide decks, charts made from the wiki
```

## The loop

1. **Ingest.** Add a source to `raw/` (Obsidian Web Clipper → markdown, images to `raw/assets/`), or ask the LLM to
   research a topic and save source notes. Register it in `raw/sources.md` with an id like `src-0007`.
2. **Compile.** The LLM reads new sources and updates the wiki incrementally: summarise each source, create or update
   concept/entity/topic articles, add `[[wikilinks]]` both ways (backlinks), cite sources by id, update `index.md`,
   append to `log.md`.
3. **Ask.** Questions are answered from the wiki first (read `index.md`, then the linked articles), going to `raw/` or
   the web only for gaps. No vector search is needed at this scale.
4. **Output.** Answers are written as files in `outputs/` (markdown, Marp slides, matplotlib PNGs), not just chat.
   Useful outputs are filed back into the wiki so later questions build on them.
5. **Publish.** An output meant for the website (essay, e-book chapter, project write-up) becomes a page
   `_pages/knowledge-base-<slug>.md` and gets a link on `/knowledge-base/` under Blog Posts, Projects or E-books.
   Every published page ends with a Sources list.
6. **Lint.** Periodic health checks: find contradictions and stale facts, fill gaps (web search), flag weak or
   uncited claims, suggest new articles and questions. Record findings in `log.md`.

## Article conventions

- Front matter: `type` (concept | entity | topic | output), `sources` (list of src ids), `updated` (YYYY-MM-DD).
- Start with a 2–3 sentence summary, then details, then `## Related` (wikilinks) and `## Sources` (src ids + URLs).
- Plain words; short sentences. Mark disputed or vendor-only claims as such.

## Copyright note

This repository is public. Full-text clips of other people's articles in `raw/` are **git-ignored** (only
`raw/sources.md`, `raw/README.md` and your own notes are committed). Keep full clips locally in Obsidian, or in a
private repo. The wiki itself holds summaries and links, which is fine to publish.
