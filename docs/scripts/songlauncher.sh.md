# CMUS Song Launcher

---

**songlauncher.sh**: Launch and play songs with `cmus` using `dmenu` interface.

---

### Dependencies

- `cmus`: A powerful and flexible music player for Unix-like systems.
- `dmenu`: A dynamic menu for X11, used here for selecting songs.
- `find`: A utility to search for files in a directory hierarchy.
- **Music Directory**: The script assumes a directory named `music` exists and contains the music files you want to play.

### Description

The script `songlauncher.sh` is a simple utility for playing music with `cmus`, leveraging the `dmenu` tool to provide a user-friendly file selection interface. When executed, it scans the `music` directory (and its subdirectories) for music files, which are then presented to you via `dmenu`. Once a file is selected, `cmus` plays it immediately using `cmus-remote`.

The command `cmus-remote -f` is used to pass the path of the selected song to `cmus`, making it start playback of the track. The use of `-L` in `find` allows for following symbolic links, which helps ensure all music files in the directory are available for selection. The `-i` flag with `dmenu` enables case-insensitive matching, and `-l 30` specifies the number of lines to be displayed, making selection easier.

### Usage

To use the script, ensure you have the necessary dependencies installed and a `music` directory with audio files:

```bash
# Ensure you are in the correct directory or provide the full path to the script
/home/matias/.scripts/bin/songlauncher.sh
```

Run the script in the terminal, and a `dmenu` prompt will appear, allowing you to type and search for the desired song. Once you press Enter, the selected song will immediately play in `cmus`. You can integrate this script into a qtile keybinding for quick access to your music library.

Example:
```bash
# Start the song launcher
sh /home/matias/.scripts/bin/songlauncher.sh
```

---

> [!TIP]
> Consider allowing the script to specify a custom directory path instead of assuming the `music` directory is in the current working directory. This improves flexibility and usability for users with various storage configurations. Additionally, error handling mechanisms for cases where `cmus` is not running or the `music` directory is empty could enhance the script's robustness.