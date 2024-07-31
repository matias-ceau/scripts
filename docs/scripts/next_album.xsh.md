# Skip to Next Album in cmus (next_album.xsh)

---

Skip to the next album in cmus player and handle playlist management.

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

- cmus (music player)
- xonsh (shell language)
- Access to a terminal to run the script

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed for use with the cmus music player. It automates the process of skipping to the next album in your playlist. The script performs the following sequence of actions:

1. It sends a command to cmus to view the current playlist.
2. It saves the currently playing tracks to a temporary m3u file.
3. It reads the saved m3u file to extract the album names.
4. It determines the currently playing album and how many tracks belong to it.
5. Finally, it skips to the next album based on the extracted album names.

The use of the xonsh shell allows for a more powerful scripting environment, facilitating string manipulation and process handling.

---

<a name="usage" />

#### Usage

To run this script, execute it from a terminal where you have access to xonsh and cmus:

```bash
xonsh /home/matias/.scripts/next_album.xsh
```

This script is ideal for integration into a keybinding within qtile or launchers for easy access.

<a name="examples" />

#### Examples

1. Run the script directly in the terminal:
   ```bash
   xonsh /home/matias/.scripts/next_album.xsh
   ```

2. Set up a keybinding in qtile:
   ```python
   Key([mod], "n", lazy.spawn("xonsh /home/matias/.scripts/next_album.xsh")),
   ```

---

<a name="notes" />

### Notes

- Ensure that cmus is running and that you have a sufficient number of albums in your playlist.
- The script relies on a temporary file (`now_playing.m3u`) for communication, ensure you have write access to `/home/matias/.temp/`.

> **Critique:** 
> The script could benefit from error handling in cases where cmus may not be running or the temporary file cannot be created. Additionally, there is an assumption that the path to albums is structured consistently, which might lead to issues if the structure changes. Implementing more robust checks or logging would improve reliability.