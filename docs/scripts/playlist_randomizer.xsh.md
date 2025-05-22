# Playlist Randomizer for cmus

---

**playlist_randomizer.xsh**: Picks a playlist of albums and plays them in random album order with cmus

---

### Dependencies

- `xonsh` : The Python-powered shell required to run this script (`.xsh`).
- `python-pandas` : Used for handling dataframes and shuffling operations.
- `cmus-remote` : Allows remote controlling of the cmus music player.
- `dmenu` : A dynamic menu for X used to select the playlist interactively.
- `ls`, `cat`, `echo`: Standard Unix utilities for filesystem and terminal interaction.

### Description

This script allows you to randomize the album order in any `.m3u` playlist and play it using cmus. The script does the following:

1. **Fetch Playlists:** Scans `~/.playlists/` for `.m3u` files and displays them (without extensions) in a dmenu prompt.
2. **Playlist Selection:** Lets you interactively pick a playlist via dmenu.
3. **Data Extraction:** Reads the selected playlist and extracts paths, which are expected to be arranged by album/file structure.
4. **Shuffle Logic:** Uses `pandas` to:
    - Extract album names from the directory structure.
    - Randomly shuffle album order while keeping track of song files within each album.
    - Sorts songs lexically within each album.
5. **Regenerate Playlist:** Outputs the randomized playlist into `~/.temp/randomized.m3u`.
6. **Control cmus:** Loads the new randomized playlist into cmus by:
    - Changing the view
    - Clearing the queue
    - Adding the shuffled playlist
    - Starting playback

### Usage

The script is intended to be run interactively from a terminal, or could be mapped to a keybinding within qtile.

**TL;DR:**
```sh
xonsh /home/matias/.scripts/bin/playlist_randomizer.xsh
```
**Workflow:**
- Script runs, `dmenu` pops up — select a playlist.
- Playback in cmus starts immediately with albums in random order.

_**If needed, map this script to a hotkey in your Qtile config for rapid access.**_

---

> [!TIP]
> - The script expects playlists in `~/.playlists/` and the `.m3u` files themselves in `/home/matias/notes/playlists/`, which may lead to confusion if the directories diverge. Consider standardizing the paths or making them configurable.
> - Error handling is minimal: if an empty playlist is chosen, or file/dirs don't exist, this will likely raise an exception or unexpected output.
> - The script assumes a specific folder structure in `.m3u`, treating the parent directory as the "album". If you store tracks differently, this could misclassify tracks.
> - Using `dmenu` here is well-suited to a qtile/Arch workflow, but an alternative fallback for headless use could be a future improvement.
> - Consider supporting alternate playlist locations with a command-line argument, and add graceful error messages for missing dependencies.