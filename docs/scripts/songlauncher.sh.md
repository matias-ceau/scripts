# cmus Song Launcher

---

**songlauncher.sh**: Play a song using `cmus` and `dmenu` for interactive selection

---

### Dependencies

- `cmus`: A small, fast and powerful console music player.
- `dmenu`: A dynamic menu for X, which is used to provide a graphical interface for song selection.
- `find`: A command-line utility to search for files in a directory hierarchy.

### Description

This script, `songlauncher.sh`, allows you to play a song using `cmus` by selecting it interactively through `dmenu`. It leverages the `find` command to search and list all files within the `music` directory, making them available for selection. The `dmenu` utility is then used to present these files in a vertical list format that supports interactive searching and selection. Once a user selects a song, `cmus-remote` is used to play the song in `cmus`. The script is lightweight and can effectively manage a large music collection, as it uses `dmenu` for a seamless user interface experience on your Arch Linux system with qtile.

### Usage

The script is straightforward to use:

1. Ensure you have `cmus` and `dmenu` installed on your Arch Linux distribution.
2. Place your music files inside a folder named `music` in your home directory or modify the script path to reflect your music directory.
3. Execute the script from a terminal or bind it to a key in qtile:

```sh
sh /home/matias/.scripts/bin/songlauncher.sh
```

For qtile, you might bind this to a key combination by adding something like this to your config:

```python
Key([mod], "m", lazy.spawn("sh /home/matias/.scripts/bin/songlauncher.sh"))
```

---

> [!TIP] 
> The script currently searches for music within a hardcoded directory named `music` relative to the execution directory. It would be advantageous to make this path configurable or dynamically adjust based on user settings or environment variables. Furthermore, adding support for different file formats or integrating a notification system to confirm song selection could enhance user experience.