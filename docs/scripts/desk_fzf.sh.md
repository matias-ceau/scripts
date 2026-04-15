# Fuzzy-launch Desktop Entries

---

**desk_fzf.sh**: Find installed `.desktop` files with fzf and run the selected entry

---

### Dependencies

- `bash`
- `fd` — fast file finder used to locate `.desktop` files
- `fzf` — interactive fuzzy picker
- `bat` — used to preview entries and to skip the cache header line
- `grep`, `head`, `cut` — parse the `Exec=` field
- `XDG_CACHE_HOME` — cache location (falls back to empty if unset; see critique)

### Description

This script searches your system for `.desktop` files, lets you pick one via `fzf`, then extracts and runs its `Exec=` command.

To keep startup fast, it maintains a cache at `$XDG_CACHE_HOME/desktop-script.txt`. The first line is a Unix timestamp; the remaining lines are absolute paths to `.desktop` files found under `/`. The cache is considered valid for 2 hours (7200 seconds). If the cache is missing/old, it is rebuilt automatically, or you can force a rebuild.

Selection UI:
- The list shown in `fzf` comes from the cache (excluding the first timestamp line).
- `--preview` renders the selected `.desktop` file with `bat`.

Execution:
- Takes the first `Exec=` line, strips common Desktop Entry field codes (`%f`, `%u`, etc.), fixes `%%` → `%`, then runs it via `bash -c`.

### Usage

Run interactively (best from a terminal, or bound to a Qtile key that spawns a terminal):

    desk_fzf.sh

Force refresh the `.desktop` cache:

    desk_fzf.sh --update

Example Qtile keybinding (spawn in your preferred terminal):

    lazy.spawn("alacritty -e desk_fzf.sh")

---

> [!TIP]
> **Potential improvements / issues**
> - `CACHE_FILE="$XDG_CACHE_HOME/..."`: if `XDG_CACHE_HOME` is empty, this writes to `/desktop-script.txt` (likely failing). Consider `CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/desktop-script.txt"` and `mkdir -p "$(dirname "$CACHE_FILE")"`.
> - `fd --search-path /` can be *very* expensive and may hit permission errors; consider targeting standard application dirs (`/usr/share/applications`, `~/.local/share/applications`, Flatpak exports).
> - The function name `update-the-cache` contains `-`, which is not a valid Bash function name; use `update_the_cache()`.
> - `bat --color=always {}` in preview will fail if the line isn’t a file path (ok here), but you may want `--preview-window=right:60%` etc. for ergonomics.
> - Executing `Exec=` via `bash -c` can mis-handle quoting; a more robust approach is to parse into an argv array or use `gtk-launch`/`dex` to respect desktop entry semantics.