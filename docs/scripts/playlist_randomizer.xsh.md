# Playlist Randomizer

---

**playlist_randomizer.xsh**: Picks a playlist of albums and plays them in random order in cmus.

---

### Dependencies

- `pandas`: A library providing high-performance data manipulation and analysis.
- `dmenu`: A dynamic menu for X, used for selecting the playlist interactively.
- `cmus`: A powerful, terminal-based music player which this script interfaces with.
- `xonsh`: A shell language that combines Python and Bash syntax; required to run the script.

### Description

The **playlist_randomizer.xsh** script is designed to streamline the process of selecting and playing music playlists in a random order using **cmus**. The script is written in **xonsh**, making Python and shell interactions seamless.

Here's how the script works:

1. **Playlist Selection**: The script begins by defining the path to the playlists stored in the `~/.playlists` directory, allowing for dynamic updates if playlists change. It lists all `.m3u` files in that directory.

2. **User Interaction**: By utilizing **dmenu**, the user is prompted to select one of these playlists from a visually appealing interactive menu.

3. **Load Playlist Content**: After selection, the script reads the corresponding `.m3u` file to extract the list of albums and songs, creating a Pandas DataFrame for further processing.

4. **Randomization**: Albums are shuffled randomly, and a new ordered playlist is constructed.

5. **Playback with cmus**: Finally, the script interfaces with cmus to clear the current playlist, add the newly randomized playlist, and start playback.

### Usage

To use the script, enter the following command in your terminal:

```bash
xonsh /home/matias/.scripts/playlist_randomizer.xsh
```

Once executed:

1. A dmenu selection will prompt you to choose a playlist.
2. After you select, the songs will be shuffled and played in cmus.

You can also bind this script to a key in your window manager for easy access.

---

> [!TIP] 
> Consider adding error handling for cases where no playlists are available or if the `.m3u` file does not exist. This could improve the user experience by providing feedback and preventing crashes. Additionally, ensure that `xonsh` is set up as your shell, or consider providing instructions for installing it.