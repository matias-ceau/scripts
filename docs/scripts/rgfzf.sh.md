# Ripgrep → fzf → Neovim jump

---

**rgfzf.sh**: Fuzzy-search ripgrep matches, preview with bat, open in Neovim at line

---

### Dependencies

- `rg` (ripgrep) — fast text search engine
- `fzf` — interactive fuzzy finder UI
- `bat` — syntax-highlighted preview for the selected file
- `nvim` — opens the chosen file directly at the matched line

### Description

`rgfzf.sh` chains together a common “search → filter → open” workflow:

1. `rg` searches your query across files and prints matches in the form `file:line:match`, with ANSI colors enabled and `--smart-case` (case-insensitive unless your query contains uppercase).
2. `fzf` consumes that stream and lets you narrow results interactively. It’s configured to:
   - understand fields separated by `:` (`--delimiter :`) so `{1}` = filename and `{2}` = line number
   - keep colors (`--ansi`) and adjust highlight styling
   - show a preview via `bat`, jumping the preview to the matching line (`--highlight-line {2}`)
   - position the preview above the list (`up,60%`) and scroll it relative to the match
3. Pressing Enter replaces the fzf process with Neovim (`become`) and jumps to the right line: `nvim {1} +{2}`.

This is ideal for quick navigation from a terminal, or for binding in qtile to pop up a terminal running the script.

### Usage

```sh
rgfzf.sh <pattern>
```

Examples (tldr-style):

```sh
rgfzf.sh "qtile"
rgfzf.sh "keybinding"
rgfzf.sh "class MyWidget"
```

Run in a terminal (interactive). In qtile, you’ll typically bind it to spawn your terminal, e.g. “open terminal and run `rgfzf.sh 'foo'`” (you’ll still type the query unless you wrap it).

---

> [!TIP]
> Consider handling the “no query” case explicitly (currently it runs `rg ""`, which may return everything or error depending on rg version/options). Also, filenames containing `:` will break the `{1}/{2}` field extraction; you could switch rg’s output to `--json` and parse it, or use a more robust delimiter strategy. Adding `--hidden`/`--glob` options (optionally toggled) can make it more useful on Arch dotfiles.