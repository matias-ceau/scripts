# Playlist Randomizer

---

**playlist_randomizer.xsh**: Randomly selects and plays a playlist of albums in cmus.

---

### Dependencies

- `pandas`: A powerful data analysis library used for handling playlist data.
- `random`: Standard Python module for generating random numbers, utilized for shuffling.
- `os`: Standard library for interacting with the operating system, used here to handle file paths.
- `cmus`: A terminal-based music player that this script interfaces with.
- `dmenu`: A dynamic menu for X, used for selecting playlists from the available options.

### Description

The **Playlist Randomizer** script automates the process of selecting a playlist of albums and playing them in random order using cmus. It leverages `xonsh`, a Python-powered shell that combines shell scripting with Python's capabilities.

Key features of the script include:

- **Playlist Selection**: The script lists all `.m3u` playlists from the user's specified playlist directory (`~/.playlists`). Users can select a playlist using `dmenu`, which is a user-friendly interface for selection.
- **Randomization**: Once the playlist is chosen, the script reads the contents of the playlist file, extracts unique albums, and shuffles their order.
- **Output Creation**: A temporary randomized playlist is created and written to `/home/matias/.temp/randomized.m3u`.
- **Interaction with cmus**: The script communicates with cmus via `cmus-remote`, clearing any existing tracks, adding the new randomized playlist, and initiating playback.

### Usage

To run the script, simply execute it from a terminal:

```bash
./playlist_randomizer.xsh
```

Make sure you have executable permission on the script. You can add the following line to your keybinding configuration in qtile if you want to run it with a keyboard shortcut:

```python
Key([mod], "r", lazy.spawn("/home/matias/.scripts/playlist_randomizer.xsh")),
```

Once executed, the script will display a list of available playlists for selection. After selecting a playlist, the music will play in a randomized order.

---

> [!TIP] 
> The script assumes that the specified paths and playlists exist. Consider adding error handling for cases where there are no playlists, or the selected file doesn’t exist. Additionally, handling for empty playlists might improve the user experience.