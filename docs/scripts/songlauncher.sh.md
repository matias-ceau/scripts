# Song Launcher

---

**songlauncher.sh**: Play a song with cmus using dmenu

---

### Dependencies

- `cmus`: A lightweight CLI music player for UNIX-like systems.
- `dmenu`: A dynamic menu for X11 that allows for efficient user selection.

### Description

The `songlauncher.sh` script is a simple utility designed to facilitate the playback of music files using the command-line music player `cmus`. By leveraging `dmenu`, a dynamic menu utility, this script allows users to browse their music files in a friendly interface and play their selection instantly.

##### Functionality Overview:

1. **File Search**: It uses the `find` command to recursively search the `music` directory for all files. The `-L` option allows the command to follow symbolic links.
2. **Music Selection**: The output of the `find` command is piped into `dmenu`, which presents the user with a list of found music files to choose from. The `-i` option makes the selection case-insensitive, and the `-l 30` option limits the display to 30 items in the menu.
3. **Playback**: Upon selection, `cmus-remote` is invoked with the `-f` option, which takes the selected file path as an argument to start playback in `cmus`.

### Usage

To run the script, simply execute it from the terminal:

```bash
sh /home/matias/.scripts/songlauncher.sh
```

This will open a dmenu listing all your music files within the `music` directory. After you select a file, it is played using `cmus`.

If you want to assign this script to a keybinding in your window manager (like `qtile`), you can do so by adding a configuration line in your `~/.config/qtile/config.py` like this:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/songlauncher.sh")),
```
This keybinding allows you to invoke the script conveniently with a keyboard shortcut.

---

> [!TIP]  
> Consider adding error handling in the script for situations where no music files are found or where `cmus` isn't installed. This would enhance user experience and provide informative feedback in case of issues. Additionally, specifying the music directory explicitly as a variable can improve flexibility for users with different directory structures.