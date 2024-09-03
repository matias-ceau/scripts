# Playlist Player Script

---

**playlist_player.xsh**: A simple script to pick and play a music playlist using cmus

---

### Dependencies

- `cmus`: A lightweight, console-based music player that allows remote control through commands.
- `dmenu`: A dynamic menu for X, allows for interaction with the user through a simple interface.
- `xonsh`: A Python-like shell that can execute shell commands and Python code.
  
### Description

The `playlist_player.xsh` script enables users to select and play music playlists stored in the `~/.playlists` directory, leveraging the `cmus` music player. The script opens with a shebang pointing to `xonsh` and begins by importing the `os` module, which provides functions for interacting with the operating system.

The `PLAYLIST_PATH` variable is initialized to point to the user's playlists directory. The script uses `cmus-remote` commands in sequence:

1. `cmus-remote -C 'view 4'`: Switches the cmus view to the playlist view.
2. `cmus-remote -C clear`: Clears the current playlist in cmus.
3. The script generates a sorted list of playlist files (only `.m3u` files) found in the specified directory.
4. It presents this list to the user through `dmenu`, allowing them to select a playlist interactively.
5. After selection, it adds the chosen playlist to `cmus` using `cmus-remote -C add {playlist}`.
6. Finally, it uses `cmus-remote -n` to move to the next track and `cmus-remote -p` to start playback.

### Usage

To use the script, you can run it from the terminal. Make sure that you have your playlists in the `~/.playlists` directory in `.m3u` format.

Run the script with the following command:
```bash
xonsh /home/matias/.scripts/playlist_player.xsh
```

After executing, you will see a list of available playlists. Use the arrow keys to select one, and press Enter to play it.

Alternatively, you could bind this script to a key in your window manager for quicker access. 

---

> [!TIP] 
> The script currently does not handle errors, such as the case where there are no playlists available. It could be improved by adding error checks, along with a notification if the user selects an empty playlist or if an invalid selection is made. Additionally, consider enhancing the user experience by displaying more detailed information about the playlists, such as the number of tracks included.