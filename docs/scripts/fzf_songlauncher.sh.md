# Song Launcher with fzf

---

**fzf_songlauncher.sh**: A simple script to play a song using `cmus`, filtered through `fzf`

---

### Dependencies

- `cmus`: A powerful CLI music player that is used to play the selected song.
- `fzf`: A command-line fuzzy finder that lets you select songs interactively.

### Description

This script allows you to play a music file using `cmus` by selecting it with the `fzf` fuzzy finder. It leverages the power of `find`, `fzf`, and `cmus` to create a lightweight music launcher for your Arch Linux setup with the Qtile window manager. The script recursively searches for music files inside the `music` directory, utilizes `fzf` to present an interactive selection interface, and then commands `cmus-remote` to play the chosen file.

### Usage

To use this script, simply execute it in a terminal. Ensure that `cmus` is running in the background:

```bash
/home/matias/.scripts/bin/fzf_songlauncher.sh
```

The script will prompt you with a list of music files found in the `music` directory. Use the arrow keys or start typing to search for a song, and press `Enter` to play your choice using `cmus`.

For automation or convenience, you can add this script to a keybinding in QTile like so:

```python
Key([mod], "m", lazy.spawn("/home/matias/.scripts/bin/fzf_songlauncher.sh")),
```

Ensure that the path to the script and the `music` directory are correctly specified.

---

> [!TIP]
> The script currently assumes the `music` directory is a relative path to the current working directory. Consider specifying the full path to ensure it works from any location in your system. Additionally, error handling could be improved to handle cases where `cmus` is not running or if no music is found.