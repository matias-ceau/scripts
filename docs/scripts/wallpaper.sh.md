# Wallpaper Rotator Script

---

**wallpaper.sh**: Randomly select, set, or browse wallpapers using feh and optional GUIs.

---

### Dependencies

- `feh`: Image viewer, used here to set wallpapers.
- `notify-send`: Displays desktop notifications about wallpaper changes.
- `fzfmenu.sh`: Script-based fuzzy file selector (required for `--select` mode).
- `yad`: Simple GUI dialog tool (required for `--gui` mode).
- `awk`, `find`, `shuf`, `sed`, `tail`, `head`, `basename`: Standard UNIX utilities.
- The environment variable `LOCALDATA` must point to your data directory.

---

### Description

This script allows you to manage wallpapers on your Arch Linux/qtile desktop environment in several flexible ways:

- **Set a random wallpaper:** It will choose a random file from `~/.wallpapers/`.
- **Interactively select a wallpaper:** Uses `fzfmenu.sh` for terminal fuzzy search, or a GUI dialog (`yad`).
- **Go back to a previous wallpaper:** Maintains a history in `~/.cache/wallpapers.log`, lets you revert.
- **Default fallback:** If no argument is provided, a default preset wallpaper is applied.
- **GUI selection & preview:** Option to select and preview wallpapers with `yad`.

Wherever a wallpaper is set, a notification pops up showing the file name.

**Logging/Caching:**  
Each applied wallpaper is logged in a cache file. The log is auto-cleaned to remove successive duplicates for accurate history traversal.  

---

### Usage

```sh
# Set a random wallpaper
wallpaper.sh --random

# Fuzzy-select a wallpaper in terminal (needs fzfmenu.sh)
wallpaper.sh --select

# Use GUI to select & preview wallpaper (needs yad)
wallpaper.sh --gui

# Revert to previous wallpaper(s), default is the last one
wallpaper.sh --previous           # previous wallpaper
wallpaper.sh --previous 2         # go back 2 wallpapers

# Set wallpaper to the default
wallpaper.sh 
```

**Pro-tip:**  
You can map any of these calls to keybindings within your qtile config for fast access.

---

> [!TIP]
> - Some improvements are possible:
>     - The script assumes `$LOCALDATA` is set, but doesn't check for it or fallback when missing; add a check at the start.
>     - The `fzfmenu.sh` dependency isn't standard and could cause confusion if not present. Consider a fallback or a check.
>     - The cache grows indefinitely except for duplicate removal; consider limiting its total length.
>     - The `--gui` mode relies on `yad`; a test for its presence (and more robust error handling) would help reliability.
>     - You may want to add file type filtering for `--random` and `--select` as is done in `--gui`.
>     - There’s potential for a race if two script invocations run at the same time and manipulate the cache.
>     - Some `find` calls might be slow on huge directories; consider parallel alternatives for large collections.
