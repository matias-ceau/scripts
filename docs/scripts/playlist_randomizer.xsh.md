# Playlist Randomizer

---

**[playlist_randomizer.xsh](playlist_randomizer.xsh)**: Randomly selects and plays a playlist of albums in cmus.

---

### Dependencies

- `pandas`: A powerful data manipulation library in Python. This script uses it to handle playlist data efficiently.
- `xonsh`: An extensible shell language and command prompt that allows for the use of Python in scripting.
- `cmus`: A modern and efficient console music player. This script interacts with cmus to manage and play music.

### Description

This script is designed for users who wish to randomize and play their music albums stored in M3U playlists using the cmus music player. It facilitates selecting a playlist from a predefined directory and shuffles the order of albums within that playlist, creating a new randomized playlist. 

The core functionalities of the script include:
- Accessing the playlists stored in `~/.playlists`.
- Displaying available playlists using `dmenu` for user selection.
- Reading the selected M3U playlist and extracting album and song names.
- Using `pandas` to create a DataFrame that manages the album and song data, allowing for easy shuffling of albums.
- Outputting the new randomized playlist to a temporary file and adding it to cmus for playback.

### Usage

To run the script, simply execute it in a terminal. You can set it up with a keybinding in the window manager or a launcher for quick access.

```bash
./playlist_randomizer.xsh
```

Upon execution, a `dmenu` prompt will pop up, displaying a list of available playlists (derived from files ending in `.m3u`). Once a selection is made, the script processes the playlist and randomizes the order. The new playlist will be played in cmus.

Key parts of the execution:
- The script clears the current cmus playlist and replaces it with the newly randomized playlist.
- It will view the updated playlist interface in cmus and start playing the randomized tracks.

---

> [!TIP]  
> Consider adding error handling for cases where the playlist directory might be empty or if the selected playlist does not exist. Additionally, ensure that the script checks if `cmus` is running before sending any commands to avoid potential errors.
