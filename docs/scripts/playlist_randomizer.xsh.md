# Playlist Randomizer Script

---

**playlist_randomizer.xsh**: Script to shuffle and play a playlist of albums in cmus.

---

### Dependencies

- `xonsh`: A Python-powered shell to execute this script.
- `pandas`: Python library for data manipulation, used to organize playlist data.
- `dmenu`: A dynamic menu for X, used to select playlists interactively.
- `cmus`: Console music player to play the selected, randomized playlist.

### Description

This script is tailored for the Arch Linux environment with qtile as the window manager. The script picks a playlist from a specified directory and plays the albums in random order using cmus, a console music player.

1. **Playlist Selection**: The script searches for `.m3u` playlist files in the `~/.playlists` directory. It uses `dmenu` to present the list of playlists for the user to choose from.
   
2. **Randomization**: After selecting a playlist, the script reads the `.m3u` file and processes its contents using `pandas`. It extracts album and song information, shuffles the albums, and reorders the songs to play the albums randomly.

3. **Playback**: The randomized playlist is saved as a temporary file and then loaded into cmus for playback.

### Usage

Run this script by invoking it in a terminal that supports the `xonsh` shell or set up a keybinding in your qtile configuration to execute it directly:

```bash
~/.scripts/playlist_randomizer.xsh
```

1. You will be prompted with a `dmenu` interface listing available playlists.
2. Select a playlist to randomize.
3. The script will create a randomized version of the playlist and play it using cmus.

Make sure that your cmus is running and configured correctly to handle `.m3u` playlist files.

---

> [!NOTE]
> Although the script efficiently randomizes and plays playlists, it assumes the structure of the playlist files and directories without any fallback or error handling. Adding validation for the existence of paths and handling cases where playlists may not be properly formatted could improve robustness. Additionally, for portability, replace hardcoded paths with configuration parameters or environment variables.