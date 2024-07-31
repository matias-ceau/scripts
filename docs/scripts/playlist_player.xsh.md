# Playlist Player Script

---

**[playlist_player.xsh](/playlist_player.xsh)**: A script for selecting and playing playlists in cmus with dmenu.

---

### Dependencies

- `cmus`: A powerful music player that runs in a terminal.
- `dmenu`: A dynamic menu for X, used for selecting options interactively.
- `xonsh`: A Python-powered shell that integrates shell commands and scripting.

### Description

This script is designed to facilitate the process of playing music playlists stored in a specific directory using the `cmus` music player. It leverages `dmenu` for a user-friendly selection interface and `xonsh` for script execution.

Here's how the script works:

1. It initializes the path to a user-defined directory (`~/.playlists`) where all playlist files are located.
2. Using `cmus-remote`, it first clears any current tracks and views the playlist interface in cmus.
3. The script then retrieves a sorted list of all `.m3u` files in the specified playlist directory.
4. The user is prompted to select a playlist from this list using `dmenu`.
5. Once the playlist is selected, it is added to `cmus`, and playback is started immediately.

The use of `os.listdir()` allows the script to dynamically retrieve and display current playlists without hardcoding them.

### Usage

To use the script, simply execute it from the command line or bind it to a key in your window manager. Here's a basic example of how to run it from the terminal:

```bash
~/scripts/playlist_player.xsh
```

You can assign this script to a keybinding in your qtile configuration to quickly access your playlists. Here’s an example configuration snippet:

```python
Key([mod], "p", lazy.spawn("~/scripts/playlist_player.xsh")),
```

When executed, the script will display a list of available playlists for you to choose from. After you select a playlist, it automatically starts playing in `cmus`.

---

> [!TIP]  
> Consider implementing error handling in the script to manage cases where the playlist directory is empty or if the user cancels the `dmenu` prompt. This would improve the user experience by preventing errors that could disrupt playback or interaction.
