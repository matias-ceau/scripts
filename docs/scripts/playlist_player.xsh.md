
---

Play a selected playlist using cmus and dmenu.

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

- `cmus`: A music player for Unix-like systems.
- `dmenu`: A dynamic menu for X, used for selecting the playlist.
- `xonsh`: A Python-powered shell that combines command prompt features with the Python programming language.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `playlist_player.xsh` script is designed to streamline the process of playing music playlists through the `cmus` music player on an Arch Linux environment using the `qtile` window manager. It provides a user-friendly interface by leveraging `dmenu` to allow users to select from all available `.m3u` playlists stored in a specified directory.

The script begins by importing the necessary `os` module and setting a predefined path for the playlists (`~/.playlists`). It first clears any existing queue in `cmus`, then retrieves and sorts all `.m3u` files in the playlist directory. The user is presented with a list using `dmenu`, from which they can choose a playlist. Once a selection is made, the script adds the playlist to the `cmus` queue and starts playback.

---

<a name="usage" />

#### Usage

To use the script, simply execute it in a terminal. You can also bind it to a key in your window manager or run it from a launcher. Ensure that your playlists are located in the `~/.playlists` directory and are in the `.m3u` format.

To run the script, use the following command in the terminal:

```bash
chmod +x /home/matias/.scripts/playlist_player.xsh
/home/matias/.scripts/playlist_player.xsh
```

<a name="examples" />

#### Examples

1. **Run the Script**:
   Simply invoke the script from a terminal:
   ```bash
   /home/matias/.scripts/playlist_player.xsh
   ```

2. **Keybinding Example** (for `qtile`):
   Add to your configuration:
   ```python
   Key([mod], "p", lazy.spawn("/home/matias/.scripts/playlist_player.xsh")),
   ```

---

<a name="notes" />

### Notes

- Make sure that `cmus` is running for the script to function properly; otherwise, the script will fail to control it.
- `dmenu` can be customized in various ways, so feel free to modify its appearance or behavior to suit your preferences.
- Ensure that the playlist files have the correct format and that they contain valid paths to music files.

> **Critique**: The script assumes that `cmus` and `dmenu` are installed and configured correctly. If these dependencies are missing, the script will not function as intended. It could be improved by adding checks for these commands and providing user feedback if they are not present. Additionally, error handling could be enhanced in case there are no playlists or if an invalid selection is made.