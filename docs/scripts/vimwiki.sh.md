# Vimwiki Note Picker (fzf + Neovim)

---

**vimwiki.sh**: Pick a Markdown note with fzf and open it in Neovim

---

### Dependencies

- `bash`
- `fd` (from `fd`) — fast file finder used to list notes
- `fzf` — interactive fuzzy picker
- `bat` — used for the Markdown preview (`bat -pplmd …`)
- `nvim` — editor used to open the selected note

---

### Description

This script provides a fast “note launcher” for your `~/notes` directory, ideal for an Arch + qtile workflow where you want a single keybinding to jump into a note.

Workflow:

1. `fd -tf '\.md$' --base-directory="$HOME/notes"` searches for regular files (`-t f`) ending in `.md` within `~/notes`, returning paths relative to that base directory.
2. The result is piped into `fzf` with `--ansi` (because `fd` is called with `--color=always`).
3. `fzf` renders a preview pane using:
   - `bat -pplmd $HOME/notes/{}`  
   where `{}` is replaced by the currently highlighted relative path.
4. On `enter`, the selection is opened via `nvim` using `--bind 'enter:become(...)'`, meaning `fzf` is replaced by `nvim` (no extra shell remains).

---

### Usage

Run interactively (best inside a terminal, or via a qtile keybinding that spawns a terminal):

    vimwiki.sh

Example qtile binding (conceptual):

    lazy.spawn("alacritty -e ~/.scripts/bin/vimwiki.sh")

Notes:
- Assumes all notes are in `~/notes` and Markdown uses the `.md` extension.
- Works recursively (subdirectories included).

---

> [!TIP]
> Consider removing `--color=always` from `fd` (or keeping it but ensure it never pollutes filenames). Typically `fd` colorizes only when outputting to a TTY; forcing color in a pipe can be fragile. Also, quote paths in the preview/action to handle spaces safely, e.g. `--preview 'bat -pplmd "$HOME/notes/{}"'` and `become(nvim "$HOME/notes/{}")`. If you want to support opening non-`.md` notes (or `.markdown`), extend the pattern or allow a directory argument.