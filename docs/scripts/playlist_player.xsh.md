# Playlist Player Script

---

**playlist_player.xsh**: Plays a selected playlist using cmus from a predefined directory.

---

### Dependencies

- `cmus` - A lightweight music player that can be controlled via the command line.
- `dmenu` - A dynamic menu for X, used to present options to the user.

### Description

This script is designed to facilitate the selection and playback of music playlists stored in the user's `~/.playlists` directory using the command line music player `cmus`. The script makes use of the `xonsh` shell, which allows for both shell syntax and Python capabilities.

Upon execution, the script performs the following steps:

1. **View Playlists**: It initially opens the playlist view in `cmus` by issuing the command `cmus-remote -C 'view 4'`.
2. **Clears Existing Queue**: The command `cmus-remote -C clear` clears any existing tracks from the current play queue.
3. **Gather Playlists**: The script then compiles a sorted list of all playlist files ending with `.m3u` in the configured playlist directory.
4. **User Selection**: It uses `dmenu` to present the playlists in a menu format, allowing the user to make a selection.
5. **Add and Play**: The selected playlist is then added to `cmus` using the command `cmus-remote -C add {PLAYLIST_PATH}/{choice}.m3u`, and playback is started with `cmus-remote -n` and `cmus-remote -p`.

### Usage

1. Ensure your playlists are stored in your `~/.playlists` directory and are in `.m3u` format.
2. Run the script in your terminal with the command:
   ```bash
   xonsh /home/matias/.scripts/playlist_player.xsh
   ```

3. A dmenu interface will appear where you can select the desired playlist.

---

> [!TIP] 
> The script could be enhanced by adding error handling to manage situations where the playlist directory is empty or when the user cancels the dmenu selection. Additionally, consider adding an option to create a new playlist or change the directory from which playlists are loaded to enhance flexibility.