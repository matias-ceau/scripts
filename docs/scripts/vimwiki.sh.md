# Vimwiki FZF Launcher

---

**vimwiki.sh**: Fuzzy search and open Markdown notes in Vim from your notes directory.

---

### Dependencies

- `fd` – fast/friendly alternative to `find`, used for finding Markdown files  
- `fzf` – command-line interactive fuzzy finder  
- `bat` – cat clone with syntax highlighting, used for file preview  
- `nvim` – Neovim text editor (can be replaced with `vim` if neovim isn't preferred)  
- Markdown notes stored in `$HOME/notes` (directory must exist)

### Description

This script streamlines the process of opening Markdown notes with `nvim`, acting as a minimal yet powerful "vimwiki" dedicated to your `$HOME/notes` directory. Here's a breakdown of its workflow:

1. **fd** lists all `.md` files directly under `~/notes` (no recursion by default), outputting colored names.
2. Output is piped to **fzf** for fuzzy selection.  
   - `--ansi` allows colored output.
   - The preview pane uses **bat** to display the currently selected Markdown file with syntax highlighting.
   - Pressing `<Enter>` opens the selected note in `nvim`.

The process is interactive and efficient, making navigating and editing your Markdown personal wiki blazingly fast within a terminal session.

### Usage

Just run the script from anywhere:

```sh
~/.scripts/bin/vimwiki.sh
```

A fuzzy picker window will appear showcasing the files in `~/notes`. Use type-to-filter to find your note.

- **Up/Down, Type** – Navigate/filter notes
- **Preview Pane** – See content instantly highlighted
- **<Enter>** – Open the note in `nvim`

#### Example tldr

```sh
$ ~/.scripts/bin/vimwiki.sh
# Fuzzy-search your notes; Enter opens in Neovim.
```

**Pro-Tip:**  
Assign a keybinding in qtile to run this script for one-keypress access to your notes.

---

> [!TIP]
> - If you want recursive search inside subdirectories, add the `-a` flag to `fd`.
> - The script currently hardcodes `$HOME/notes` and `.md` files only; making these configurable (via env vars or args) would improve flexibility.
> - The obsolete commented-out line at the end (`vim ~/notes/"$( ls ~/notes | fzf )"`) can be removed for clarity.
> - Consider handling the case where `fd`, `fzf`, or `bat` aren't installed; a check could inform the user gracefully instead of failing silently.
> - Using `nvim` instead of `vim` may not match all setups—let the user choose via a variable or fallback mechanism.