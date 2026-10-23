---
type: concept
sources: [src-0014, src-0019, src-0020]
updated: 2026-10-23
---
# The shell (terminal)

A text interface for running programs. On macOS the default shell is zsh. Core skills: navigation, reading files,
running scripts, installing tools ([[package-managers]]), environment variables, managing processes and ports,
permissions, and remote login ([[ssh]]).

## Key points
- History is saved in plain text (`~/.zsh_history`): never type secrets; use `.env` files.
- Useful syntax: quotes/backslash for spaces, `|`, `$( )`, `2>/dev/null`, `--`, line continuation `\`.
- Prefer `kill` before `kill -9`; prefer `python3 -m pip` over bare `pip`.

## Related
[[git]] · [[ssh]] · [[package-managers]] · [[missing-semester]]

## Published
[Top 10 Terminal Commands](/knowledge-base/terminal-commands/)
