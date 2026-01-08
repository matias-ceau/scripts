# Cmus Playlist Randomizer (album-shuffled)

---

**playlist_randomizer.xsh**: Pick a playlist and play albums in randomized order via cmus

---

### Dependencies

- `xonsh` — script runner/shell
- `python-pandas` — builds and sorts a small table of tracks
- `dmenu` — interactive playlist chooser (nice for qtile keybindings)
- `cmus` + `cmus-remote` — controls playback
- `ls`, `cat` — used through xonsh `$()` subprocess capture

---

### Description

This script lets you select an `.m3u` playlist and then **reshuffles playback by album**, keeping songs grouped by album while randomizing the album order.

Workflow:

1. Lists available playlists from `~/.playlists` (filenames with `m3u`), strips the extension, and pipes the list into `dmenu`.
2. Reads the selected playlist from `/home/matias/notes/playlists/{selected}.m3u`.
3. Parses each non-empty line as a file path:
   - `album` is inferred from the parent directory name (`.../<album>/<song>`),
   - `song` is inferred from the basename.
4. Uses a `pandas.DataFrame` to:
   - compute unique albums,
   - `random.shuffle()` them,
   - assign an album “order” index,
   - sort by `(album order, song name)` to keep tracks in-album in a deterministic order.
5. Writes the resulting playlist to `/tmp/randomized.m3u`, then instructs cmus to clear the queue, add the randomized playlist, jump to next, and play.

---

### Usage

Run interactively (needs `dmenu`):

- `playlist_randomizer.xsh`

Suggested qtile keybinding (example):

- Bind to a key and run via `lazy.spawn("~/.scripts/bin/playlist_randomizer.xsh")`

What it does (tldr):

- Select playlist → builds `/tmp/randomized.m3u` → loads it into cmus → starts playback

---

> [!TIP]
> A few path inconsistencies: playlists are listed from `~/.playlists` but read from `/home/matias/notes/playlists/`; consider using a single `PLAYLIST_PATH` for both. The filter `if 'm3u' in i` may match non-playlist names; prefer `i.endswith('.m3u')`. Sorting by `songs` (filename) may not match track order—if your `.m3u` is already ordered, you could preserve original per-album order by keeping the line index instead of sorting alphabetically. Finally, ensure cmus is running; otherwise `cmus-remote` will fail—adding a check (or starting cmus) would make it more robust.