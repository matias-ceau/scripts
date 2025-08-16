# Next Album (cmus) — skip to the next album quickly

---

**next_album.xsh**: Skip remaining tracks to start of next album in cmus

---

### Dependencies

- `xonsh` — shell used to run the script
- `cmus` — console music player
- `cmus-remote` — control cmus from the command line
- `coreutils` — for `cat` (used via xonsh subprocess)

### Description

This xonsh script fast-forwards cmus to the first track of the next album in your current play context.

How it works:
- Switches cmus to a specific view (`view 4`) that should reflect your current playback list (playlist/queue/library depending on your setup).
- Saves that view to `/tmp/now_playing.m3u`.
- Parses the m3u lines, extracts album names from the directory structure (second-to-last path component).
- Obtains the current album (also via path parsing from `cmus-remote -Q`).
- Counts how many consecutive entries at the start of the saved list belong to the current album.
- Sends `cmus-remote -n` repeatedly to skip those tracks and land at the beginning of the next album.

This approach is filesystem-hierarchy based (album = folder), which fits a typical organized library on Arch. It does not use tags.

### Usage

- Make the script executable and run it when cmus is playing:
```
chmod +x ~/.scripts/bin/next_album.xsh
~/.scripts/bin/next_album.xsh
```

- Bind to a qtile key (recommended):
```
# in ~/.config/qtile/config.py
from libqtile.config import Key
from libqtile.lazy import lazy

keys += [
    Key([], "XF86AudioNext", lazy.spawn("~/.scripts/bin/next_album.xsh")),  # next album
]
```

- Trigger from a terminal or a dmenu/rofi launcher:
```
next_album.xsh
```

Tip: If you already use XF86AudioNext for next track, consider another key or a chord to avoid conflicts.

---

> [!WARNING]
> Potential issues and improvements:
> - Off-by-one risk: `counter` starts at 1; if your current album appears N times at the start of the saved list, the loop may skip N+1 tracks, potentially jumping past the first track of the next album. Consider initializing `counter = 0`.
> - Fragility in parsing: `current_album` relies on splitting the path in `cmus-remote -Q`. Prefer parsing the `tag album` line from `-Q` or using `%a` via `format_print`.
> - View dependency: `view 4` must correspond to your “upcoming tracks” view. If it doesn’t, adapt the view number to your workflow.
> - Temp file collisions: use a unique temp file (e.g., `mktemp`) instead of a fixed `/tmp/now_playing.m3u`.
> - No error handling if cmus isn’t running; add guards for better robustness.