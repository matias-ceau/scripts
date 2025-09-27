# cmus Playlist Album Randomizer (xonsh)

---

**playlist_randomizer.xsh**: Pick an m3u playlist, shuffle album order, play via cmus

---

### Dependencies

- `xonsh` — shell interpreter used by the script.
- `python` — required by xonsh; system Python on Arch.
- `python-pandas` — builds a DataFrame to group/shuffle albums.
- `dmenu` — interactive playlist picker.
- `cmus` and `cmus-remote` — music player and control CLI.
- `coreutils` (`ls`, `cat`) — used via xonsh subprocess calls.

### Description

This script lets you choose an `.m3u` playlist via `dmenu`, then plays it in cmus with albums randomized but tracks within each album kept in sorted order. It:

1) Lists `.m3u` names in `~/.playlists`, presents them with `dmenu -i -l 30`, and captures your selection.
2) Reads the selected playlist’s entries (one path per line), filters out blanks, and derives two columns: album directory (parent folder) and song filename.
3) Randomizes album order, sorts songs within each album alphabetically, and writes the result to `/tmp/randomized.m3u`.
4) Controls cmus: switches to playlist view (`view 4`), clears the queue, adds the randomized playlist, then starts playback (`-n`, `-p`).

This is ideal on Arch + qtile for a quick, keyboard-driven shuffle by album while preserving album cohesion.

### Usage

- Run interactively from a terminal: `~/.scripts/bin/playlist_randomizer.xsh`
- Bind in qtile (example): add a key calling `lazy.spawn('xonsh ~/.scripts/bin/playlist_randomizer.xsh')`.
- Ensure cmus is running: e.g., start `cmus` first; `cmus-remote` requires a running instance.
- Expected locations:
  - Playlists listed from: `~/.playlists` (names shown in dmenu).
  - Playlist file read from: `/home/matias/notes/playlists/<selected>.m3u` (see critique).
  - Output: `/tmp/randomized.m3u`.

tldr:
- Prepare `.m3u` files with absolute paths to tracks.
- Hit your binding or run the script.
- Pick a playlist in dmenu.
- cmus queue is replaced with a randomized-by-album order and starts playing.

---

> [!TIP]
> - The script lists playlists from `~/.playlists` but reads from `/home/matias/notes/playlists`. Unify to a single `PLAYLIST_PATH` to avoid mismatches.
> - `i.split('.')[0]` will truncate names containing multiple dots; prefer strict extension checks (e.g., endswith `.m3u`) and `Path.stem`.
> - Add early exits for empty selection, missing files, or a non-running cmus; handle `#EXTM3U` and comments.
> - Sorting tracks alphabetically may break track order; parse track numbers or use natural sorting.
> - Consider dropping `pandas` for a lightweight approach if performance or dependency size matters.