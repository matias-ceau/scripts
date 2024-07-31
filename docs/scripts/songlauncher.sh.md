# Song Launcher

---

**[songlauncher.sh](/songlauncher.sh)**: Play a song with cmus using dmenu

---

### Dependencies

- `cmus`: A multipurpose audio player for Unix-like operating systems. This script utilizes `cmus` to control playback of your music files.
- `dmenu`: A dynamic menu for X, which is used in this script to display a list of music files for selection. 

### Description

The `songlauncher.sh` script is a simple shell script that leverages the capabilities of `cmus` and `dmenu` to allow users to play a song directly from their music files. The script uses the `find` command to locate all music files in the specified directory (`music` in this case) and then presents them in a dmenu interface, from which the user can select a song to play.

This script is executed in the shell and functions effectively within the Qtile window manager environment on Arch Linux. 

The usage of `find -L` extracts all file types in the `music` directory, and `-type f` ensures only files are listed. The `dmenu -i -l 30` part specifies that the dmenu should be case insensitive (`-i`) and list up to 30 items (`-l 30`) at a time for selection.

### Usage

To run the script, it simply needs to be executed from the terminal. You can also bind it to a key combination within your window manager configuration for easier access.

Here’s how to run the script from the terminal:

```bash
~/path/to/songlauncher.sh
```

Replace `~/path/to/` with the actual path where your `songlauncher.sh` is located. 

Additionally, you may consider adding a keybinding in your Qtile configuration like this:

```python
keybinds.extend([
    Key([mod], "p", lazy.spawn("sh ~/path/to/songlauncher.sh")),
])
```

With this keybinding, pressing `mod + p` will invoke the song launcher.

---

> [!TIP]  
> This script assumes the `music` directory is located in the current working directory. Consider allowing users to specify a path via command-line arguments to enhance functionality. Additionally, checking if `cmus` is running before executing `cmus-remote` may prevent unexpected errors.
