# Random Album Player for cmus

---

**random_album.xsh**: Selects 10 random albums from your cmus library and plays them.

---

### Dependencies

- `xonsh`: The shell interpreter required to run this script.
- `cmus`: Console music player. `cmus-remote` is used for playback control.
- `.config/cmus/lib.pl`: Plain text file used as a library index (full file paths, one per line).
- Standard Python modules: `random`, `os`.

---

### Description

This script automates the process of selecting and playing a random set of albums in `cmus` on your Arch Linux system running qtile. It does the following:

1. Clears the current cmus playlist and moves to the library view.
2. Reads all track paths from `.config/cmus/lib.pl`, which is expected to contain one file path per line.
3. Identifies unique albums by joining the last two directory components of each path (assumes a structure like `/path/to/music/Artist/Album/Track`).
4. Randomly picks 10 unique albums and gathers all their tracks.
5. Writes the resulting track list to a temporary playlist file at `~/.config/cmus/.temp.m3u`.
6. Loads this playlist into cmus and starts playback from the first track.

This script is particularly useful for quickly shuffling through your music collection by album, providing a fresh listening experience each time.

---

### Usage

You can run this script directly from the terminal:

```
xonsh /home/matias/.scripts/bin/random_album.xsh
```

Or add it to your PATH and execute:

```
random_album.xsh
```

For integration with qtile keybindings, you can add a custom shortcut in your qtile config to execute this script.

**No arguments are required. The script operates automatically on execution.**

---

> [!TIP]
> - Assumes your `.config/cmus/lib.pl` is always up-to-date and follows a directory structure where the album is identifiable by the last two components of the path. If your music is organized differently, results may be inaccurate.
> - The script does not check if there are at least 10 albums in your library, which may result in `IndexError` if you have fewer.
> - Temporary playlist is always overwritten—be cautious if you use `.temp.m3u` for other purposes.
> - Old commented code (using `beet ls -a`) can be removed for clarity.
> - Consider wrapping the main logic in a function for better readability and error handling, especially to manage exceptions from malformed paths or missing files.