# Song Launcher (songlauncher.sh)

---

Plays a song with cmus using dmenu for song selection.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `cmus` - A small and fast music player for Unix
- `dmenu` - A dynamic menu for X, used to select the song 

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `songlauncher.sh` script provides a simple way to select and play a song using `cmus`, a console-based music player, in conjunction with `dmenu`, a dynamic menu. This script aims to enhance the music streaming experience in a minimalistic way.

When executed, the script uses the `find` command to locate music files within a specified directory (`music` in this case). These files are then piped into `dmenu`, allowing the user to browse and select their desired song. Once a song is selected from the `dmenu` interface, the script plays the chosen track with `cmus-remote -f`.

---

<a name="usage" />

#### Usage

To run the script, you need to execute it from the terminal. Make sure it is executable with the following command:

```bash
chmod +x /home/matias/.scripts/songlauncher.sh
```

You can then run the script by typing:

```bash
/home/matias/.scripts/songlauncher.sh
```

Optionally, you can bind it to a key in your window manager (qtile) for quicker access.

<a name="examples" />

#### Examples

1. To play a song, simply run:
    ```bash
    /home/matias/.scripts/songlauncher.sh
    ```
2. If you have a keybinding set up (example in qtile config):
    ```python
    Key([mod], "m", lazy.spawn("~/.scripts/songlauncher.sh")),
    ```

---

<a name="notes" />

### Notes

- You may want to change the path in the `find` command if your music files are stored in another location.
- The script currently lists a maximum of 30 files at a time. This can be adjusted by changing the `-l 30` flag in the dmenu command.

> **Critique**: 
> 
> - The script lacks error handling; if no music files are found, or if `dmenu` is canceled, it will still execute cmus-remote with an empty argument which could lead to unexpected results. 
> - Improve user experience by adding checks to ensure music exists or providing a fallback option in case of failure. Also, consider adding a configuration option for the music directory to enhance flexibility.