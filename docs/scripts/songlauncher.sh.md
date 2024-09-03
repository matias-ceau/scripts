# Song Launcher

---

**songlauncher.sh**: Play a song with cmus using dmenu

---

### Dependencies

- `cmus`: A small, fast, and powerful music player for Unix-like operating systems.
- `dmenu`: A dynamic menu for X which allows for simple and efficient navigation.

### Description

The `songlauncher.sh` script is an efficient solution to play music tracks using the `cmus` music player in conjunction with `dmenu`, a lightweight dynamic menu. 

When executed, the script performs the following operations:
1. **Searching for Music Files**: It uses the `find` command to locate all music files in the specified directory (`music`). The `-L` option ensures that it follows symlinks.
2. **Displaying a Menu**: The found files are presented in a graphical menu through `dmenu`. The `-i` option makes the menu case-insensitive, while `-l 30` limits the display to 30 lines, allowing for better usability when many files are present.
3. **Playing Selected Track**: The `cmus-remote -f` command is used to play the selected song from the output of `dmenu`.

This script is particularly useful for users who wish to quickly play a song from their music directory without navigating through their file manager.

### Usage

To use this script, run it directly from your terminal:

```bash
sh /home/matias/.scripts/songlauncher.sh
```

Upon execution, a list of music files will be displayed in `dmenu`. Navigate through the list and select a song to start playing it in `cmus`. 

You can also create a keybinding in your window manager (qtile) to launch this script quickly. For example, you may add the following to your `config.py`:

```python
Key([mod], "m", lazy.spawn("sh /home/matias/.scripts/songlauncher.sh")),
```

This allows you to press a specific key combination to open the song launcher instantly.

---

> [!TIP] 
> Consider adding error handling to your script. For example, if `find` does not return any music files, the script currently fails silently. You could check if the command returns any results before passing it to `cmus-remote`. This would enhance the user experience significantly.