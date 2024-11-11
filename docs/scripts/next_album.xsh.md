# Next Album Skipper Script

---

**next_album.xsh**: Skip to the next album when playing music in cmus

---

### Dependencies

- `xonsh`: A Python-powered, cross-platform, Unix-gazing shell language and environment.
- `cmus`: A small, fast and powerful console music player for Unix-like operating systems.

### Description

This script is designed for use with the **cmus** music player, allowing the user to skip to the next album in their playlist. It is quite handy for those who enjoy listening to full albums sequentially and want to easily move to the next one while using cmus in a terminal environment.

The script works as follows:
1. It sets the view to library mode in cmus (`view 4`).
2. It saves the current playlist to a temporary file named `now_playing.m3u` in your `.temp` directory.
3. The script reads the tracks from this playlist, determining which album they belong to by analyzing the directory structure of the music files.
4. It identifies the current album being played and calculates how many tracks to skip to reach the next album.
5. It then executes the `cmus-remote -n` command repeatedly to skip the necessary number of tracks and thus start playing the next album.

### Usage

The script should be executed in an `xonsh` compatible environment and can be integrated into your workflow using keybindings in `qtile` or executed directly from the terminal:

```shell
./next_album.xsh
```

Alternatively, you can set it as a shortcut in your `qtile` configuration to easily skip albums with a hotkey while enjoying your music.

---

> [!TIP]
> Consider adding error handling to this script. For instance, if no music is playing or if it cannot find the `now_playing.m3u` file, the script should gracefully notify the user rather than failing silently. Also, the script assumes a specific directory structure for music files; if the structure changes, it might not work correctly. You could enhance it to make these paths or assumptions configurable.