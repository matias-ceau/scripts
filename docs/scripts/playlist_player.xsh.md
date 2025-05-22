# Playlist Player (cmus Edition)

---

**playlist_player.xsh**: Select and play a saved `.m3u` playlist in cmus via dmenu

---

### Dependencies

- `xonsh`: Shell interpreter used to run this script (shebang: `#!/usr/bin/env xonsh`)
- `cmus-remote`: Command-line remote control for cmus music player
- `dmenu`: Dynamic menu for X; used to select playlists
- Playlist directory: Assumes playlists are stored as `.m3u` files in `~/.playlists`

### Description

This script provides an interactive way to select and play a playlist in `cmus` on your Arch Linux system. Here's a breakdown of its functionality:

1. **Playlist Discovery:** The script looks for `.m3u` files in your `~/.playlists` directory, collecting each filename (without extension).
2. **dmenu Interface:** All discovered playlists are presented in a dmenu prompt, allowing you to select the one you wish to play.
3. **cmus Control:**
   - Switches to cmus library view #4 (presumably playlist view).
   - Clears the current cmus queue.
   - Adds the selected playlist to the cmus queue.
   - Skips to the next track (to trigger the playlist load properly).
   - Starts playback in cmus.

The workflow is linear and interacts with the user only via `dmenu`, making it a fast and distraction-free playlist launcher suitable for keybindings or scripting within your qtile Window Manager environment.

### Usage

You can run this script from your terminal or bind it to a key combination (recommended for qtile users):

```sh
playlist_player.xsh
```

#### Example workflow:

1. Script runs and opens dmenu listing all `.m3u` playlists in `~/.playlists`:
    ```
    +----------------------------+
    | my_rock_playlist           |
    | relaxing_sounds            |
    | synthwave_collection       |
    +----------------------------+
    ```
2. Select one (e.g., `synthwave_collection`), press Enter.
3. That playlist is instantly loaded and playback starts in cmus.

**For qtile users:**  
Bind the script to a convenient key combination in your qtile config for seamless use.

---

> [!TIP]
> - The script assumes all `.m3u` files are directly under `~/.playlists`. It does not handle nested directories or non-`.m3u` playlist formats.
> - There is no error checking for the existence of cmus, dmenu, or the playlist directory; running it without these in place will fail without clear error messages.
> - If two playlists have the same prefix before `.m3u` (e.g., `foo.m3u`, `foo.bak.m3u`), both will appear as `foo` and may cause confusion.
> - You might want to add logic to detect and report when no playlists are found, or when the user cancels dmenu (currently tries to add a `.m3u` with an empty name if nothing is selected).