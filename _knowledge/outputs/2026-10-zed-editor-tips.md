_October 2026 · Missing Semester_

Zed is a fast, modern code editor. It opens instantly, has AI built in, and lets you keep your old habits: switch it to **Sublime Text** keys and most of your muscle memory still works. These are the shortcuts and habits that make the biggest difference. Keys are for **macOS** (on Windows/Linux, read `cmd` as `ctrl`).

### First: turn on Sublime keys

Open the command palette with `cmd-shift-p`, type **"toggle base keymap selector"**, and pick **Sublime Text**. Or add this to your settings file (`cmd-alt-,`):

```json
{
  "base_keymap": "SublimeText",
  "format_on_save": "on",
  "autosave": "on_focus_change",
  "soft_wrap": "editor_width"
}
```

Zed keeps its own defaults and lays Sublime's keys on top, so you get both.

### 1. Find anything, fast

| Keys | What it does |
|---|---|
| `cmd-shift-p` | **Command palette**: every action by name. If you remember one shortcut, make it this. |
| `cmd-p` or `cmd-t` | Go to a file by typing part of its name |
| `cmd-r` | Go to a function or heading **in this file** |
| `cmd-shift-r` | Go to a function or class **anywhere in the project** |
| `ctrl-g` | Go to line number |
| `alt-cmd-o` | Open a recent project |
| `cmd-shift-t` | Reopen the tab you just closed |

### 2. Multiple cursors (the Sublime superpower)

| Keys | What it does |
|---|---|
| `cmd-d` | Select the word, press again to add the next match |
| `cmd-k cmd-d` | Skip this match, go to the next one |
| `cmd-u` | Undo the last cursor you added |
| `ctrl-cmd-g` or `cmd-shift-l` with a word selected | Select **every** match at once |
| `cmd-shift-l` with lines selected | Put one cursor at the end of each line |
| `ctrl-shift-up` / `ctrl-shift-down` | Add a cursor on the line above or below |
| `alt-click` | Add a cursor where you click |
| `escape` | Back to one cursor |

Example: rename `price` in five places. Put the cursor on it, press `cmd-d` five times, type the new name.

### 3. Edit lines without the mouse

| Keys | What it does |
|---|---|
| `cmd-l` | Select the whole line (press again to grow) |
| `cmd-shift-k` | Delete the line |
| `cmd-shift-d` | Duplicate the line or selection |
| `ctrl-cmd-up` / `ctrl-cmd-down` | Move the line up or down |
| `cmd-enter` / `cmd-shift-enter` | New line below / above, from anywhere in the line |
| `cmd-shift-j` | Join the next line onto this one |
| `cmd-/` | Comment or uncomment |
| `cmd-]` / `cmd-[` | Indent / outdent |
| `cmd-shift-a` or `ctrl-shift-m` | Grow the selection to the surrounding block (press again to keep growing) |
| `cmd-k cmd-u` / `cmd-k cmd-l` | UPPER / lower case |
| `f5` | Sort the selected lines |

### 4. Search and replace

| Keys | What it does |
|---|---|
| `cmd-f` | Find in this file (`cmd-g` / `cmd-shift-g` for next / previous) |
| `cmd-e` | Use the selection as the search text |
| `cmd-shift-f` | Find in the **whole project** |
| `cmd-shift-h` | Show replace in project search |
| `alt-cmd-x` / `alt-cmd-c` / `alt-cmd-w` | Toggle regex / match case / whole word |

Zed's project search shows results as one editable page (a *multibuffer*): fix every match right there and save once. Press `alt-enter` on any selection to open those spots as a multibuffer too.

### 5. Understand code

| Keys | What it does |
|---|---|
| `f12` or `alt-cmd-down` | Go to definition |
| `shift-f12` | Find all references |
| `ctrl--` / `ctrl-_` | Go back / forward (after jumping around) |
| `f2` | Rename a symbol everywhere, safely |
| `cmd-.` | Quick fixes and code actions |
| `cmd-k cmd-i` | Show the type or docs under the cursor |
| `cmd-shift-m` | All errors and warnings in the project |
| `cmd-shift-i` | Format the file |
| `alt-cmd-[` / `alt-cmd-]` | Fold / unfold a block |

### 6. Panels, panes and terminal

| Keys | What it does |
|---|---|
| `cmd-k cmd-b` or `cmd-b` | Show or hide the file sidebar |
| ``ctrl-` `` | Show or hide the terminal |
| `cmd-j` | Show or hide the bottom panel |
| `cmd-\` | Split the editor to the right |
| `cmd-1` … `cmd-9` | Jump to tab 1 … 9 (`cmd-9` = last tab) |
| `cmd-{` / `cmd-}` | Previous / next tab |
| `shift-escape` | Zoom the current pane to full size, and back |

### 7. Git, AI and Markdown

| Keys | What it does |
|---|---|
| `ctrl-shift-g` | Git panel: stage, commit, push (see my [Git post](/knowledge-base/git-commands/)) |
| `cmd-alt-g b` | Git blame: who changed each line |
| `ctrl-.` / `ctrl-,` | Jump to next / previous changed block |
| `cmd-k cmd-z` | Undo your changes to this block (restore from Git) |
| `cmd-?` | Open the AI agent panel |
| `shift-alt-m` | Markdown preview beside the file |

### Habits that pay off

1. **Use the palette, then learn the key.** The palette shows each command's shortcut next to its name. Use it twice and you will remember it.
2. **Open projects from the terminal.** Run **"cli: install cli binary"** from the palette once, then `zed .` opens the current folder (see my [Terminal post](/knowledge-base/terminal-commands/)).
3. **Make your own keys.** `cmd-k cmd-s` opens the keymap editor: search an action, click, press the keys you want.
4. **Let the editor format and save.** With `format_on_save` and `autosave` on, you stop thinking about either.
5. **Check, don't guess.** Zed changes quickly. If a key does nothing, search for the action in `cmd-k cmd-s` to see its current binding.

**Sources:** [Zed docs: Key bindings](https://zed.dev/docs/key-bindings) · [Zed default macOS keymap](https://github.com/zed-industries/zed/blob/main/assets/keymaps/default-macos.json) · [Zed Sublime Text keymap (macOS)](https://github.com/zed-industries/zed/blob/main/assets/keymaps/macos/sublime_text.json)
