# Random Album Player

---

**random_album.xsh**: Selects and plays a random album using cmus.

---

### Dependencies

- `xonsh`: A shell that combines Python and Bash.
- `cmus`: A small, fast, and powerful console music player.
- `cmus-remote`: Part of cmus, used to interact with a running cmus instance.
- `os`: A module providing a way of using operating system dependent functionality.
- `random`: A module for generating random numbers.

### Description

The script `random_album.xsh` is designed to enhance your music experience by randomly selecting an album from your cmus library and playing it. The script does this by:

1. Clearing the current cmus playlist and navigating to the library view.
2. Extracting album paths from your cmus library (`lib.pl` file).
3. Randomizing the list of albums and selecting the first 10 to create a temporary playlist.
4. Saving these tracks to a temporary `.m3u` playlist file.
5. Utilizing `cmus-remote` to enqueue the songs and play them.

This script is particularly useful for music enthusiasts using cmus who wish to explore their collection randomly without manually selecting albums.

### Usage

To use this script, ensure you have cmus running, then simply execute the script:

```shell
xonsh /home/matias/.scripts/bin/random_album.xsh
```

Alternatively, you can map this script to a keybinding in your qtile configuration for quick access. The script assumes your cmus library is defined in `~/.config/cmus/lib.pl` and outputs a temporary playlist to `~/.config/cmus/.temp.m3u`.

---

> [!TIP]
> While the script effectively selects and plays random albums, there are potential improvements:
> - The script might fail if less than 10 unique albums are available; consider adding a condition to handle such cases.
> - Absolute paths for files and directories would make the script more robust, where possible.
> - Using `beet` for album selection is partially implemented but commented out; consider finalizing or removing this feature for clarity.