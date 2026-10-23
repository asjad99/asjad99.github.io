---
type: concept
sources: [src-0028, src-0029, src-0030]
updated: 2026-10-24
---
# Code editors (Zed)

Zed is a fast native code editor with built-in AI, Git and terminal. Setting `"base_keymap": "SublimeText"` layers
Sublime's keys on Zed's defaults. Keymap editor: `cmd-k cmd-s`; settings file: `cmd-alt-,`.

## Key points
- Highest-value skills: command palette, file/symbol finder, multiple cursors, line editing, project search
  (multibuffers), go-to-definition/rename, panes and terminal.
- Sublime layer adds: `cmd-r` (symbols in file), `cmd-shift-r` (project symbols), `cmd-t` (files), `cmd-shift-d`
  (duplicate), `ctrl-cmd-up/down` (move line), `cmd-k cmd-b` (sidebar), `ctrl-cmd-g` (select all matches), `f5` (sort).
- Conflicts exist between layers (e.g. `ctrl-0`, `ctrl-1…` in Pane context); check the keymap editor.
- Keymaps read from Zed's main branch on 2026-10-24; releases may lag or differ.
- CLI: palette "cli: install cli binary", then `zed .`.

## Related
[[shell]] · [[git]] · [[missing-semester]]

## Published
[Zed Editor Tips (Sublime Keys)](/knowledge-base/zed-editor-tips/)
