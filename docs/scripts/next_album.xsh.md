# Next Album Script for CMUS

---

**next_album.xsh**: Skip to the next album in CMUS music player.

---

### Dependencies

- `cmus`: A small, fast, and powerful console music player for Unix-like operating systems.
- `xonsh`: A Python-powered shell that can execute shell commands.
  
### Description

This script is designed to control the CMUS music player, specifically to skip to the next album in the currently playing playlist. The script begins by sending a command to CMUS to view the fourth output pane. It then saves the currently playing tracks to a temporary `m3u` playlist file located at `/home/matias/.temp/now_playing.m3u`.

Following this, it reads the contents of the playlist and processes it to build a list of albums. The script extracts the album names from the paths where the tracks are located, ignoring duplicates and focusing solely on the currently playing album. Through a loop, the script determines how many albums should be skipped based on the current album.

Finally, based on the calculated count, the script issues a command to CMUS to skip to the next track in the playlist until it reaches the first track of the next album. 

### Usage

To use the script, ensure it is executable and then run it directly in the terminal or bind it to a key in your window manager. To make the script executable, you can use the following command:

```bash
chmod +x /home/matias/.scripts/next_album.xsh
```

Then you can execute it with:

```bash
/home/matias/.scripts/next_album.xsh
```

Alternatively, this script can be assigned to a keybinding in your window manager (e.g., Qtile) for quick access.

---

> [!TIP]  
> This script saves the current playlist to a file and parses it, which could be slow with large playlists. Consider simplifying the album retrieval process or checking if CMUS has built-in options for more efficient album navigation. Additionally, error handling could be added to ensure the script behaves well when interactions with CMUS fail.