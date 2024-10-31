# Playlist Randomizer

---

**playlist_randomizer.xsh**: Pick a playlist of albums and play in random order using cmus

---

### Dependencies

- `xonsh`: A shell language that compiles to Python and supports running in interactive mode.
- `pandas`: Open-source Python library for data manipulation and analysis.
- `random`: Python built-in module to generate pseudo-random numbers.
- `os`: Python built-in module to interact with the operating system.
- `dmenu`: A dynamic menu for X11, used to select a playlist.
- `cmus`: A small, fast and powerful console music player.
- `cmus-remote`: Tool for controlling cmus via command line.

### Description

This script allows you to select a playlist of albums saved with the `.m3u` file extension and randomizes the order of album playback on `cmus`, a console music player. The script scans a designated playlists directory (`~/.playlists`), presents available playlists via `dmenu`, and reads the content of the selected playlist.

Each album's tracks are gathered, and a randomized order is assigned before rearranging within albums. It then saves this new order into a temporary file, `randomized.m3u`, and queues them for playback in `cmus` using its remote control utility.

### Usage

This script is intended to be executed from the terminal or as part of an automated script or keybinding in your qtile environment. Below is a typical usage example:

```bash
xonsh /home/matias/.scripts/bin/playlist_randomizer.xsh
```

- Ensure your playlists are stored in `~/.playlists`.
- Run the script to choose a playlist and enjoy a shuffled sequence of albums.

Incorporate it into a binding or script for quick access from your qtile window manager's interface.

---

> [!CAUTION]
> The script assumes all playlists have the `.m3u` extension and are stored in `~/.playlists`. Ensure these exist to avoid errors. Additionally, consider replacing the fixed paths with configuration variables to enhance portability. Using `os.path.join` instead of string concatenation for file paths can improve compatibility and code readability.