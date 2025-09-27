# Next Album (cmus)

---

**next_album.xsh**: Skip to the next album in cmus

---

### Dependencies

- `xonsh` — runs the .xsh script (Python-powered shell)
- `cmus` — console music player
- `cmus-remote` — command-line control for cmus (bundled with cmus)
- `coreutils` — for `cat` used by the script
- `qtile` — optional, for keybinding integration on your WM

### Description

This Xonsh script jumps playback to the first track of the next album in your current cmus view. It works by:
1) Switching cmus to view 4.
2) Saving the current view into /tmp/now_playing.m3u.
3) Reading that list, deriving album names from each file’s parent directory.
4) Querying cmus for the currently playing file, inferring its album from its parent directory.
5) Counting how many consecutive tracks belong to the current album, then issuing cmus-remote -n that many times to land on the next album’s first track.

It assumes your music library is organized as .../Artist/Album/Track.ext so the parent directory name corresponds to the album.

### Usage

- Run directly from a terminal (ensure it’s executable):
```
chmod +x ~/.scripts/bin/next_album.xsh
~/.scripts/bin/next_album.xsh
```

- Put it on your PATH (e.g., ~/.scripts/bin is already on PATH) and call:
```
next_album.xsh
```

- Qtile keybinding (Arch Linux):
```
# in your config.py
from libqtile.config import Key
from libqtile.lazy import lazy

keys += [
    Key([], "XF86AudioNext", lazy.spawn("~/.scripts/bin/next_album.xsh")),
]
```

- Xonsh alias:
```
aliases['next-album'] = '~/.scripts/bin/next_album.xsh'
next-album
```

Requirements:
- cmus must be running with an active view (playlist/queue/library).
- The view at index 4 should correspond to the list you want to traverse.

---

> [!TIP]
> Potential improvements and caveats:
> - Assumes album equals the parent directory of the file. If your library is flat or organized differently, use tags instead (e.g., parse cmus-remote -Q for tag album or use cmus-remote -C 'format_print %l').
> - cmus-remote -Q indexing relies on the second line being file. More robust: parse the line starting with file or tag album.
> - View 4 may not be what you expect if views are customized. Consider saving the current playlist explicitly (e.g., save -p) if that matches your workflow.
> - Use a unique temp file (mktemp) and clean it up.
> - Add error handling for when cmus isn’t running or /tmp/now_playing.m3u is empty.