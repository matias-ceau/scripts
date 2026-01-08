# Random album picker for cmus

---

**random_album.xsh**: Build a random-albums playlist from cmus library and start playback

---

### Dependencies

- `xonsh` — executes this hybrid Python/shell script
- `cmus` + `cmus-remote` — clears the queue, loads an `.m3u`, starts playback
- `cat` — reads your cmus library list
- `~/.config/cmus/lib.pl` — expected to exist and contain track paths (one per line)

### Description

This script generates a temporary playlist containing tracks from **10 randomly selected albums** from your cmus library, then immediately plays it.

Workflow:

1. Resets the current cmus state:
   - `cmus-remote -U` unloads current queue
   - switches to view 4 (library view) and clears the current view/playlist
2. Reads `~/.config/cmus/lib.pl` and treats each line as a track path.
3. Derives “album identifiers” by taking the last **two directory components** of each path: `.../<artist>/<album>/<track> -> artist/album`.
4. Shuffles the unique album list and selects the first 10.
5. Collects all tracks belonging to those albums and writes them to `/tmp/tmp.m3u`.
6. Queues the generated playlist, starts playing, and skips to the next track (`-n`) so playback begins immediately.

This is well-suited for a qtile keybinding to “hit and get a fresh album run” without opening a terminal.

### Usage

Run manually:

    random_album.xsh

Typical qtile keybinding idea:

    Key([mod], "F9", lazy.spawn("random_album.xsh"))

What it effectively does (tldr):

- clear cmus
- pick 10 random `artist/album` pairs from `~/.config/cmus/lib.pl`
- build `/tmp/tmp.m3u`
- `cmus-remote -q /tmp/tmp.m3u && cmus-remote -p && cmus-remote -n`

---

> [!TIP]
> Consider using absolute paths when reading the library: `~/.config/cmus/lib.pl` is referenced as `.config/cmus/lib.pl` (relative), which will fail unless the script is launched from your home directory. Also, `range(10)` will crash if you have fewer than 10 unique albums; clamp with `min(10, len(albums))`. Finally, writing to a fixed `/tmp/tmp.m3u` can race with concurrent runs—use `mktemp`/`tempfile` for safer temp handling.