# Playlist Player Script

---

**playlist_player.xsh**: A script for selecting and playing music playlists using `cmus`.

---

### Dependencies

- `xonsh`: A Python-powered, Unix-gazing shell language and command prompt.
- `cmus`: A small, fast and powerful console music player for Unix-like operating systems.
- `dmenu`: A dynamic menu for X, useful for selecting items from a list.

### Description

The `playlist_player.xsh` script automates the task of playing music playlists through cmus, which is a command-line based media player. The script is implemented using `xonsh`, a shell that combines Python and bash capabilities.

Upon execution, the script performs the following actions:
1. Switches `cmus` to the playlist view to ensure the playlists are displayed properly.
2. Clears the current queue of songs in `cmus`.
3. Retrieves a list of `.m3u` playlist files from the directory `~/.playlists`. It removes file extensions for cleaner display.
4. Displays these playlists using `dmenu`, which allows you to choose one interactively.
5. Once a playlist is chosen, it's added to the `cmus` queue, starting with the first track.

### Usage

To use this script:
- Ensure it has execution permissions: `chmod +x /home/matias/.scripts/bin/playlist_player.xsh`
- Run it from the terminal:
  ```bash
  ./home/matias/.scripts/bin/playlist_player.xsh
  ```
- Choose a playlist from the menu that appears. `cmus` will start playing the selected playlist.

This script can be assigned to a keybinding in your window manager (qtile) for quick access, or executed manually from the terminal.

---

> [!TIP]
> Consider adding error handling to manage cases where the playlist directory does not exist or is empty. Additionally, using `os.path.join()` instead of direct string concatenation improves platform independence. However, as you're on `Arch Linux`, this isn't a current concern but keeps the script cleaner and follows best practices.