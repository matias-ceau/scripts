# Wallpaper Picker & History

---

**wallpaper.sh**: Set wallpapers (random/select/gui) and keep a history for “previous”

---

### Dependencies

- `bash`
- `feh` — applies the wallpaper (`--bg-scale`)
- `libnotify` (`notify-send`) — on-change desktop notification
- `find`, `shuf`, `tail`, `head`, `sed`, `wc`, `awk` — core CLI utilities used for selection/history
- `yad` — optional GUI list + preview mode (`--gui`)
- `fzfmenu.sh` — optional selector used by `--select` (your wrapper around fzf/rofi/etc.)

---

### Description

`wallpaper.sh` is a small wallpaper manager for your Arch + qtile setup. It can:

- set a **default wallpaper** (fallback when no args are given),
- pick a **random** file from `~/.wallpapers/`,
- let you **interactively select** a wallpaper via `fzfmenu.sh`,
- provide a **GUI picker + preview** using `yad`,
- maintain a simple **history log** at `~/.cache/wallpapers.log` so you can go back to previous wallpapers.

When a wallpaper is applied, the script:
1) calls `feh --bg-scale <path>`  
2) sends a notification showing the filename  
3) appends the path to the cache log

At the end, it deduplicates the log with `awk '!seen[$0]++'`, which removes repeated entries (note: not only successive duplicates).

---

### Usage

tldr-style:

- Set default wallpaper:
  - `wallpaper.sh`

- Random wallpaper:
  - `wallpaper.sh --random`

- Select via `fzfmenu.sh`:
  - `wallpaper.sh --select`

- Go back in history (1 step back by default):
  - `wallpaper.sh --previous`
  - `wallpaper.sh --previous 2`

- GUI picker (yad list + preview):
  - `wallpaper.sh --gui`

Qtile keybinding example:
- bind a key to `~/.scripts/bin/wallpaper.sh --random` (or `--previous`).

---

> [!TIP]
> Improvements to consider:
> - Ensure the cache file exists before writing: `mkdir -p ~/.cache; : > "$CACHE"` if missing.
> - Quote variables consistently (`$CACHE`, `"$LOCALDATA"`), and avoid hardcoding `/home/matias` to keep it portable.
> - The “Remove successive duplicate entries” comment is misleading: current `awk` removes all duplicates globally, not just successive ones.
> - `--previous` both reads and truncates history; consider a safer “cursor” approach or keep full log and store an index.
> - Add `set -euo pipefail` (with care) and validate `feh` success before modifying history.