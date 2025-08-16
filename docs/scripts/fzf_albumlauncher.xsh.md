# FZF album launcher for cmus

---

**fzf_albumlauncher.xsh**: Choose an album with fzf and play it in cmus, saving a playlist

---

### Dependencies

- `xonsh` — shell interpreter used to run the script.
- `beets` — music library manager; `beet ls -a` lists albums.
- `fzf` — interactive fuzzy finder for album selection.
- `cmus-remote` — controls a running cmus instance.
- `sed` — used to strip the “Artist - ” prefix from beets output.
- `qtile` — optional, for binding the script to a key.

### Description

This xonsh script lets you interactively choose an album from your beets library and immediately queue/play it in cmus.

Flow:
- Builds an album list via `beet ls -a`, strips the “Artist - ” prefix with `sed`, and pipes to `fzf` for selection.
- If a selection is made, it:
  - Switches cmus views, clears the current queue, and applies a filter for the chosen album.
  - Marks results, adds up to 100 tracks to the queue (`lqueue 100`), clears the filter, then starts playback (next + play).
  - Saves the session playlist to `/tmp/nowplaying.m3u`.

This integrates well on Arch Linux with qtile: trigger it via a keybinding or the terminal. It assumes cmus is running and reachable by `cmus-remote`.

### Usage

TL;DR
- Prepare cmus and beets; ensure your library is scanned.
- Run the script and pick an album.

Terminal:
```
~/.scripts/bin/fzf_albumlauncher.xsh
```

Qtile keybinding (in config.py):
```
from libqtile.config import Key
from libqtile.lazy import lazy

keys += [
    Key([], "F9", lazy.spawn("/home/matias/.scripts/bin/fzf_albumlauncher.xsh")),
]
```

Arch install (if needed):
```
sudo pacman -S xonsh beets cmus fzf sed
```

Tips:
- For more precise album names (no sed needed), change the selection line to:
  - `beet ls -a -f '$album' | fzf`
- To preview before play, add fzf options (e.g., `--height 40% --reverse`).

---

> [!TIP]
> Improvements:
> - Quote safety: album names with quotes may break the filter. Escape `selection` (e.g., use a format from beets that avoids quotes or escape with Python).
> - Robust beets output: prefer `beet ls -a -f '$album'` instead of `sed`, which can fail if album names contain “ - ”.
> - Handle empty/aborted selection explicitly and exit cleanly.
> - Ensure cmus is running; otherwise start it or detect errors from `cmus-remote`.
> - Consider batching cmus commands or using a here-string for fewer calls.
> - Make `lqueue` count configurable via an env var or CLI arg.