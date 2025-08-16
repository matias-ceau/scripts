# CMUS Album-Order Randomizer

---

**playlist_randomizer.xsh**: Randomizes album order from an m3u playlist and plays it in cmus

---

### Dependencies

- `xonsh` — shell interpreter used by the script
- `python-pandas` — builds/reshuffles track lists by album
- `dmenu` — interactive playlist selector
- `cmus`/`cmus-remote` — player and remote control interface
- `coreutils` (`ls`, `cat`, `echo`) — used via xonsh subprocess syntax

### Description

This xonsh script lets you pick an existing `.m3u` playlist, then plays it in cmus with albums randomized but tracks kept in album order.

Workflow:
1. Lists `.m3u` names from `~/.playlists` and prompts selection via `dmenu -i -l 30`.
2. Reads the selected playlist file and splits it into paths.
3. Derives “album” as the penultimate path component and “song” as the filename.
4. Uses `pandas` to:
   - Shuffle album order randomly.
   - Sort tracks within each album by song name (lexicographic).
5. Writes the reordered list to `/tmp/randomized.m3u`.
6. Controls cmus: switches to library view, clears queue, adds the randomized playlist, and starts playback.

Assumes your audio files are laid out so that album = second-last path segment (e.g., /Music/Artist/Album/01 - Track.flac).

### Usage

- Run from terminal:
  ```
  ~/.scripts/bin/playlist_randomizer.xsh
  ```
  Select a playlist in dmenu; playback starts in cmus.

- Qtile keybinding (Arch, qtile):
  ```
  Key([mod], "F9", lazy.spawn("~/.scripts/bin/playlist_randomizer.xsh"))
  ```

- Install deps on Arch:
  ```
  sudo pacman -S xonsh python-pandas dmenu cmus
  ```

Notes:
- `cmus-remote` requires a running cmus instance; start cmus once (e.g., in a terminal or a qtile scratchpad).
- Track order within albums relies on file name sorting; include track numbers in names for correct order.

---

> [!TIP]
> Potential improvements:
> - Path inconsistency: selection lists from `~/.playlists`, but the script reads from `/home/matias/notes/playlists/{selected}.m3u`. Unify to the same directory (use `PLAYLIST_PATH` for reading).
> - Robust filtering: the `'m3u' in i` check may pick non-`.m3u` files; use a proper `.endswith(".m3u")`.
> - Quoting and spaces: rely less on `ls` parsing; use Python to enumerate files to avoid edge cases.
> - Sorting tracks: lexicographic sort can misorder tracks if names lack leading numbers; parse track numbers when present.
> - Error handling: add checks for empty selection, missing files, and empty playlists; print user-friendly messages.
> - Reproducibility: accept a seed or allow toggling album reshuffle vs. full shuffle.