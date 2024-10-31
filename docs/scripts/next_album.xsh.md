# CMUS Next Album Skipper

---

**next_album.xsh**: Skip to the next album in the CMUS music player

---

### Dependencies

- `xonsh`: A Python-powered shell supporting the execution of Python and shell commands.
- `cmus`: A small, fast, and powerful console music player.
- `cmus-remote`: A tool provided by CMUS for remote control via command line.

### Description

This script allows the user to skip to the next album while playing music in CMUS. The process is as follows:

1. The script changes the view in CMUS to show playlists using the command `cmus-remote -C 'view 4'`.
2. It saves the currently playing list to a temporary file located at `/home/matias/.temp/now_playing.m3u`.
3. The script reads this file into a list of tracks (`now`), filtering out empty lines.
4. It extracts album names from each track’s file path, assuming the directory structure contains albums.
5. It retrieves the currently playing album.
6. The script counts how many tracks from the current album have been played.
7. It then skips to the next album using `cmus-remote -n` for each track in the current album.

### Usage

To skip to the next album in CMUS, you can run this script from the terminal or bind it to a key in qtile. Here's how you can execute it directly in the terminal:

```shell
xonsh /home/matias/.scripts/bin/next_album.xsh
```

For more convenience, consider adding a keybinding in your qtile configuration like this:

```python
Key([mod], "n", lazy.spawn('xonsh /home/matias/.scripts/bin/next_album.xsh')),
```

This would bind the script to 'Mod+n', allowing you to skip albums without opening a terminal.

---

> [!WARNING] 
> The current implementation assumes the album directory is directly preceding the track in the file path. Any changes to this directory structure will require adjustments. Also, if CMUS is handling a large library, saving the current playlist might affect performance. Storing temporary data should handle exceptions in case CMUS fails to output correctly.