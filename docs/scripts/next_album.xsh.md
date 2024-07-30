# Next Album (next_album.xsh)

---

Skip to next album in cmus player.

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

- `cmus`: The Cmus audio player.
- `xonsh`: A shell language that is a Python-based alternative to traditional shells.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `next_album.xsh` script is designed for users of the `cmus` music player to easily skip to the next album in their queue. It automates the process of identifying the currently playing album, storing the list of all playing tracks, and then skipping to the next album in line.

The script first executes a command to view the currently playing track's index and saves the playlist of currently playing music to a temporary file. It processes this file to extract a list of album names, identifies the album currently playing, and then uses a loop to skip the necessary number of times to reach the next album.

The use of `cmus-remote` allows the script to send commands to the `cmus` player from the terminal, providing an efficient way to control playback without needing to manually navigate through tracks.

---

<a name="usage" />

#### Usage

To use the script, ensure that it is executable by running:

```bash
chmod +x /home/matias/.scripts/next_album.xsh
```

Then, you can run the script directly from your terminal or bind it to a keybinding in your window manager (qtile) for quick access:

```bash
/home/matias/.scripts/next_album.xsh
```

When executed, the script will automatically handle the logic of skipping to the next album.

<a name="examples" />

#### Examples

- **Running the script manually**:
```bash
/home/matias/.scripts/next_album.xsh
```

- **Keybinding in Qtile**:
```python
Key([mod], "n", lazy.spawn("/home/matias/.scripts/next_album.xsh")),
```

---

<a name="notes" />

### Notes

- The script assumes that you have a working setup of `cmus` and that your music library is organized in a way that the album folder names are meaningful.
- Ensure that the temporary file path (`/home/matias/.temp/now_playing.m3u`) is writable by the script.

> **Critique**: 
> 
> - The script could be improved by adding error handling for cases where `cmus` might be inactive, or the playlist file cannot be created/read. 
> - Another enhancement could involve checking if the user's music library follows a specific directory structure, and if not, informing the user with a message. 
> - Furthermore, incorporating user-defined configurations for the temporary file location could make the script more flexible.