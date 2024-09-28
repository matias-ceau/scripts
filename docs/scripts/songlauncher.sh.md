# Song Launcher with dmenu

---

**songlauncher.sh**: Script to play a song using `cmus` with a `dmenu` interface.

---

### Dependencies

- `cmus`: A powerful ncurses-based music player.
- `dmenu`: A dynamic menu for X, used to present song choices.
- `find`: A utility to search for files in a directory hierarchy.

### Description

This script provides an interactive way to play songs through `cmus` using the visual selection capability of `dmenu`. It leverages the `find` command to list all the files within the 'music' directory (and subdirectories) and passes this list to `dmenu`. The `dmenu` presents these options to you, allowing selection of a file to play. Once a selection is made, `cmus-remote` is used to play the chosen song.

The core pipeline of the script is:
- `find -L music -type f`: Lists all files in the `music` directory. Using `-L` allows it to follow symbolic links, and `-type f` filters for regular files.
- `dmenu -i -l 30`: Provides an interactive list from which the user can choose. The `-i` flag makes the selection case-insensitive, and `-l 30` sets the list's height to show up to 30 items.
- `cmus-remote -f`: Plays the selected track in the `cmus` player.

### Usage

You can run this script from a terminal or bind it to a key combination within your qtile configuration for quick access. Follow this example to execute the script:

```sh
./songlauncher.sh
```

This command initiates the `dmenu` interface to pick a song from the `music` directory. Ensure that `cmus` is running before executing the script.

---

> [!TIP] 
> The script is designed to search within a directory named `music`. To make this script more flexible, you could allow passing a directory path as an argument to search in. Additionally, ensuring that `cmus` is running or prompting the user to start `cmus` if it's not could enhance user experience.