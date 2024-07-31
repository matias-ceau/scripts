# Album Player (albumplayer.xsh)

---

Play an album using cmus, with album selection via dmenu.

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

- cmus
- dmenu
- xonsh

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `albumplayer.xsh` script is designed to facilitate the playback of music albums using the cmus music player from a selected list. The process leverages `dmenu` for user interaction and `xonsh` for scripting, which is a Python-powered shell that allows for a more comfortable way to run shell commands.

The script begins by defining the path to a temporary `.m3u` playlist file used by cmus. It retrieves a list of available music paths from `lib.pl`, then creates a distinct list of albums by slicing the path strings. 

A dictionary (`fancy_dict`) is constructed to pair each album's extracted name with its path for a clearer output in `dmenu`. Upon selection of an album from the `dmenu` interface, the script generates a playlist that includes tracks from the chosen album and a random selection from other albums.

The final step involves writing the generated playlist to the temporary file, followed by commands to control cmus, including updating the view, clearing the current playlist, and loading the new playlist.

---

<a name="usage" />

#### Usage

To use the script, simply run it in your terminal:

```shell
xonsh /home/matias/.scripts/albumplayer.xsh
```

You may want to bind this script to a key combination in your window manager for easier access.

<a name="examples" />

#### Examples

1. Run the script directly:
   ```shell
   xonsh /home/matias/.scripts/albumplayer.xsh
   ```
   This will prompt you to select an album through the `dmenu`.

2. After selecting an album, cmus will automatically start playing the album along with tracks from other random albums.

---

<a name="notes" />

### Notes

- The script expects your music library to be set up correctly in the `cmus` configuration.
- Ensure that `dmenu` is properly installed and configured on your system for seamless operation.

> **Critique:** 
> - The script could benefit from error handling to manage cases where `lib.pl` might not exist or where no albums are found. 
> - There is no feedback for the user if the selection process fails (e.g. when no album is chosen), which may cause confusion. Adding checks and informative messages would enhance usability.
> - The hard-coded limit of `10` for random albums could be parameterized or set to a configurable option to increase flexibility.