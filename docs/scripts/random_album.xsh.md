# Random CMUS Album Shuffle

---

**random_album.xsh**: Select 10 random albums from cmus and start playback

---

### Dependencies

- `xonsh` — shell interpreter used to run the script
- `cmus` — console music player
- `cmus-remote` — remote control CLI for cmus
- `~/.config/cmus/lib.pl` — cmus library index used to list all tracks

### Description

This Xonsh script builds a temporary M3U playlist from 10 randomly selected albums in your cmus library and starts playback.

How it works:
- Clears the current cmus playlist and switches to the playlist view.
- Reads track paths from your cmus library file (`~/.config/cmus/lib.pl`).
- Extracts album identifiers as “Artist/Album” from each track path.
- Shuffles the album list, picks the first 10, then gathers all tracks belonging to those albums.
- Writes the resulting track list to `/tmp/tmp.m3u`, queues it in cmus, and starts playing.

It uses Xonsh’s command capture `$(...)` to read the library file and Python’s `random` to shuffle. Paths are matched by checking if “Artist/Album/” appears in the full track path, which is a lightweight way to group tracks by album when the library is path-structured.

### Usage

Run directly from a terminal:
```
~/.scripts/bin/random_album.xsh
```

Bind to a Qtile key (Arch Linux):
```
# in ~/.config/qtile/config.py
from libqtile.config import Key
from libqtile.lazy import lazy

keys += [
    Key([mod], "F9", lazy.spawn("xonsh ~/.scripts/bin/random_album.xsh")),
]
```

Run periodically (systemd user timer example snippet):
```
systemctl --user start random-album.service
```
Then implement ExecStart in the service as:
```
ExecStart=/usr/bin/xonsh /home/matias/.scripts/bin/random_album.xsh
```

tldr:
- Refill cmus with 10 random albums and play: run the script.
- Rerun anytime to reshuffle.

---

> [!TIP]
> - Path bug: `$(cat .config/cmus/lib.pl)` is relative; use `~/.config/cmus/lib.pl` via `os.path.expanduser` to avoid failures outside $HOME.
> - Fragile count: `range(10)` will crash if less than 10 albums exist; prefer `random.sample(albums, k=min(10, len(albums)))`.
> - Temp file clobbering: `/tmp/tmp.m3u` may collide; use a unique file (`tempfile.NamedTemporaryFile`) and remove after use.
> - Matching robustness: string “in” matching can misfire on similar names; consider grouping by parsed path components for exact artist/album directories.
> - Performance: avoid external `cat`; read the file with Python for speed and fewer dependencies.
> - Behavior: `cmus-remote -n` skips the first track; remove if you want to start from track 1.