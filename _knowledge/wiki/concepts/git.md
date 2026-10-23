---
type: concept
sources: [src-0014, src-0015, src-0016, src-0017, src-0018, src-0019]
updated: 2026-10-23
---
# Git

Git keeps the history of a folder as snapshots (commits). GitHub hosts a shared copy online. Everyday work needs
about ten commands: config, clone, status, add, commit, push, pull, fetch, switch/checkout, log/diff.

## Key points
- Loop: pull → edit → status → add → commit → push.
- `fetch` downloads without merging; `git fetch origin pull/N/head:name` checks out a GitHub pull request locally.
- Authenticate with an [[ssh]] key or `gh auth login`.
- Never commit secrets; check `git status` before `git add .`.

## Related
[[shell]] · [[ssh]] · [[code-editors]] · [[missing-semester]]

## Published
[Top 10 Git Commands](/knowledge-base/git-commands/)
