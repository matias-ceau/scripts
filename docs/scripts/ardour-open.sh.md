# Ardour Session Picker (FZF + Preview)

---

**ardour-open.sh**: Pick a recent Ardour session from ~/audio/PROJECTS and open it

---

### Dependencies

- `bash`
- `fd` — fast file finder used to locate `*.ardour` sessions
- `stat` — fetches mtime so sessions can be sorted by “most recent”
- `sort`, `sed`, `xargs` — formatting + ordering pipeline
- `bat` — syntax-highlighted preview of the `.ardour` XML session file
- `ardour` — the DAW itself
- `improved-fzfmenu.sh` — your wrapper around `fzf` (menu UI, preview handling)

### Description

This script provides a quick launcher for Ardour sessions stored under `~/audio/PROJECTS`. It:

1. Searches for `*.ardour` files in `$AUDIO_PROJECTS`.
2. Sorts them by last modification time (newest first).
3. Displays them in an ANSI-colored interactive menu (via `improved-fzfmenu.sh`).
4. Shows a live preview of the selected session file using `bat` (XML highlighting, full style, wrapped).
5. Opens the chosen session with `ardour`.

Notable helpers:

- `search_cmd()`: builds the candidate list, applying ANSI color and stripping the leading base path for readability.
- `strip_ansi()`: removes ANSI escape codes (important because the menu entries contain color codes).
- `get_path()`: reconstructs the absolute path from the menu entry while sanitizing ANSI codes.
- `preview_cmd()`: renders the selected `.ardour` file in the preview pane.

### Usage

Run from a terminal (or from a qtile keybinding that spawns a terminal/menu wrapper):

- Launch picker:
  - `ardour-open.sh`

tldr:
- Navigate list → see preview → press Enter → Ardour opens the session.

qtile example:
- Bind to a key and spawn:
  - `lazy.spawn("alacritty -e /home/matias/.scripts/bin/ardour-open.sh")`
  - or if `improved-fzfmenu.sh` is terminal-less, spawn directly:
    - `lazy.spawn("/home/matias/.scripts/bin/ardour-open.sh")`

---

> [!TIP]
> Consider hardening edge cases: handle empty selection (user presses Esc) before calling `ardour`, and guard against filenames containing newlines/spaces (the `xargs stat` pipeline can break). Also, `SHELL=$(which bash)` is unused and can be removed. If you want truly “most recently used” rather than mtime, you could track selection history in a cache file.