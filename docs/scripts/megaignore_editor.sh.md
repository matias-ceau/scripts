# Megaignore editor (fzf + nvim)

---

**megaignore_editor.sh**: Find, preview, edit or delete `.megaignore` files interactively

---

### Dependencies

- `bash`
- `fd` (find `.megaignore` files fast)
- `fzf` (interactive picker)
- `bat` (preview syntax-highlighted file content)
- `nvim` (editor opened on `Enter`)
- `rm` (coreutils; delete action via `Ctrl-d`)

### Description

This script provides a quick “control panel” for managing `.megaignore` files across your system. It repeatedly searches for files named `.megaignore` under:

- `$HOME`
- `/mnt` (useful if you mount external drives or sync targets there)

Results are piped into `fzf` with a `bat` preview pane. From the picker you can:

- Press `Enter` to open the selected file in Neovim (`enter:become(nvim {})`). Using `become` replaces the `fzf` process with `nvim`, keeping the workflow snappy.
- Press `Ctrl-d` to delete the selected file (`ctrl-d:execute(rm {})`). This executes immediately from inside `fzf`.

After each action, the script prompts whether to continue, allowing multiple edits/deletions in one session.

This is well-suited to an Arch Linux + qtile setup where you want a fast launcher-like workflow without writing a full GUI tool.

### Usage

Run from a terminal (recommended) or bind it to a qtile key that spawns a terminal.

tldr:

- Start the manager:
  - `megaignore_editor.sh`
- In `fzf`:
  - `Enter` → edit the highlighted `.megaignore` in Neovim
  - `Ctrl-d` → delete the highlighted `.megaignore`
- After exiting:
  - `y` / `Enter` → search again
  - `n` → quit

Example qtile idea (conceptually): bind a key to spawn your terminal running `megaignore_editor.sh`.

---

> [!CAUTION]
> - `Ctrl-d` deletes immediately with `rm {}`: consider adding a confirmation step (e.g., `rm -i`, `trash-put`, or a custom prompt) to avoid accidental loss.
> - Paths with spaces may behave poorly in the `rm {}` binding; using `rm -- "{}"` (and ensuring proper quoting) is safer.
> - `fd` is limited to `$HOME` and `/mnt`; if you also use `/media` or other mount points on Arch, consider adding them or making search paths configurable via arguments.