# Interactive `bat` language tester

---

**try_the_bat_suit.sh**: Pick a file and preview it with `bat` using a chosen syntax language

---

### Dependencies

- `bash`
- `bat` — syntax-highlighting pager
- `fzf` — interactive selection UI + preview pane
- `fd` — fast file finder (used when no file argument is provided)
- `ripgrep` (`rg`) — parses the selected language line from `bat --list-languages`
- `sed`, `cut` — lightweight parsing/color formatting

### Description

This script is an interactive playground to quickly test how `bat` highlights a given file under different syntax definitions.

Workflow:

1. **Choose a file**
   - If the first argument is an existing file, it is used.
   - Otherwise, it launches `fd` piped into `fzf` so you can pick a file interactively.

2. **Choose a `bat` language**
   - It reads available syntaxes via `bat --list-languages`.
   - The language names are tinted blue with `sed` to improve readability in the list.

3. **Preview**
   - While navigating languages in `fzf`, the preview pane runs `preview_cmd`:
     - Extracts the language token after `:` from the selected `bat` line (e.g. `Python: py, pyw` → `-lpy`)
     - Runs `bat -pp --color=always "$FILE"` with that `-l…` override.

This is particularly handy on Arch + qtile to bind to a key and visually compare syntaxes without editing config files.

### Usage

```sh
# Pick a file interactively, then browse bat syntaxes with a preview
try_the_bat_suit.sh
```

```sh
# Provide a file directly
try_the_bat_suit.sh ~/.config/qtile/config.py
```

Suggested qtile usage: bind it to a key and launch in a terminal (kitty/alacritty), since it’s fully interactive.

---

> [!TIP]
> Improvements to consider:
> - The language parsing assumes the first alias after `:` is valid (`-l...`). Some entries may not map cleanly; using `bat --list-languages --plain` (if available) or more robust parsing could help.
> - `fd . -tf` searches from the current directory; you may want a default base dir (e.g. `$HOME`) for consistency.
> - If `fzf` returns an empty selection, `bat` will error; add guards for empty `$FILE` and empty language selection.
> - `SHELL=/usr/bin/bash` is set but not used; you can remove it unless you rely on it elsewhere.