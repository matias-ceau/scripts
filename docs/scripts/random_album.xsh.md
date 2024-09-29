# Random Album Selector

---

**random_album.xsh**: Select random album and play it with cmus

---

### Dependencies

- `cmus`: A music player that allows terminal control for playlist management.
- `xonsh`: A Python-powered shell that combines Python and shell commands for scripting.

### Description

The `random_album.xsh` script automates the process of selecting a random album from your music library and playing it using `cmus`, a powerful terminal-based music player. This script utilizes `xonsh`, enabling seamless integration of Python and shell scripting.

1. **Preparation**: The script begins by specifying the temporary playlist path in `~/.config/cmus/.temp.m3u`.
2. **Interaction with cmus**: It first updates the existing `cmus` session using commands to view the appropriate playlist view (`view 4`), clear the existing playlist, and fetch paths to the albums stored in `lib.pl`.
3. **Album Selection**: The script extracts album names and shuffles them randomly, then constructs a new playlist containing tracks from the first 10 randomly selected albums.
4. **Writing the Playlist**: It writes the generated playlist to the temporary `.m3u` file, making it ready for playback.
5. **Playback**: Finally, it instructs `cmus` to load the new playlist and begins playback.

### Usage

To run the script, make sure you have `xonsh` installed and have access to `cmus`. You can execute the script directly from the terminal with the following command:

```sh
xonsh /home/matias/.scripts/random_album.xsh
```

This will initiate the process to select and play a random album through `cmus`. You might want to create a keybinding in your window manager (like `qtile`) to make this script easily accessible while using your system.

Additionally, for automation, you could include this script in your startup applications or bind it to a keyboard shortcut.

---

> [!TIP]  
> Consider adding error handling to check if `cmus` is running or if `lib.pl` exists. This will make the script more robust and user-friendly. Also, you might want to allow configuration of how many albums to fetch by passing an argument to the script.