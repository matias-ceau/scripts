# Chezmoi Config Picker & Editor

---

**edit_chezmoi_cfg_files.sh**: Fuzzy-pick chezmoi-managed files/dirs, edit them, then optionally apply/sync

---

### Dependencies

- `bash`
- `chezmoi` — lists managed paths, opens editor via `chezmoi edit`, applies via `chezmoi apply`
- `fzf` — interactive picker with live reload bindings
- `bat` — file preview with syntax highlighting
- `eza` — colored listing + icons (used as fzf input + dir preview)
- `fd` — expands a selected directory into a list of files to edit
- `$SCRIPTS/sync-repo.sh` — custom script to sync your dotfiles repo (used on “apply and sync”)
- Environment: `$CHEZMOI` and `$SCRIPTS` are assumed to exist for the sync path

### Description

This script is a TUI workflow for managing your chezmoi dotfiles on Arch (ideal to bind in qtile). It:

1. Saves your starting directory (`INITIAL_DIR`) and switches to `$HOME`.
2. Builds an fzf list from `chezmoi managed`, formatted through `eza` (with colors/icons).
3. Provides a preview pane:
   - If the selected item is a file: uses `bat` with full style and forced color; includes filetype mappings for `*autosave` and `*.conf` as INI.
   - If it’s a directory: shows a tree via `eza -T`.
4. Lets you toggle the list contents:
   - `Alt-f`: reload managed files
   - `Alt-d`: reload managed directories
5. After selection:
   - File → `chezmoi edit <path>`
   - Directory → `chezmoi edit $(fd . -tf <dir>)` (batch edit all files under it)
6. Prompts to apply and optionally sync your repo, then returns to the original directory.

### Usage

Run interactively (needs a terminal):

- Launch:
  - `~/.scripts/bin/edit_chezmoi_cfg_files.sh`
- In fzf:
  - `Alt-f` → show files
  - `Alt-d` → show directories
  - `Enter` → edit selection
- After editing:
  - `a` (default) → `chezmoi apply`
  - `s` → `chezmoi apply` + `$SCRIPTS/sync-repo.sh $CHEZMOI`
  - `x` → exit without applying

Suggested qtile binding example:
- `lazy.spawn("alacritty -e ~/.scripts/bin/edit_chezmoi_cfg_files.sh")`

---

> [!TIP]
> A few rough edges to consider: (1) `path="$selected"` is likely wrong when you `cd $HOME` and `eza` outputs relative paths; you probably want `path="$HOME/$selected"` after `remove_icons`. (2) Unquoted variables (`cd $HOME`, `chezmoi edit $(fd ...)`) can break on spaces—quote defensively and use arrays. (3) `remove_icons` strips non-printables but icons are printable; better to disable icons for the fzf source or output a raw path column for selection while still previewing with icons. (4) `SHELL=$(which bash)` is unused except as an env var name shadow; prefer `SHELL="$(command -v bash)"` or remove it.