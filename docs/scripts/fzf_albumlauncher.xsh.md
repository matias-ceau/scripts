# Album Launcher Script (fzf_albumlauncher.xsh)

---

Launches an album from Beet using fzf to interactively select and play it with cmus.

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

- **fzf**: A command-line fuzzy finder.
- **cmus**: A small, fast, and powerful console music player.
- **beet**: Beets is a music library manager and notational database.
- **xonsh**: A Python-powered shell that makes scripting easy.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to select a music album via an interactive interface using `fzf`. Once an album is selected, it utilizes `cmus` commands to:

1. View the current music queue.
2. Clear the queue.
3. Filter the album based on the selection.
4. Add the album's tracks to the current queue.
5. Save the current queue to a playlist.

The album selection is sourced from `beet`, which manages the music library, ensuring that users can quickly find and play their desired album.

---

<a name="usage" />

#### Usage

To execute the script, simply run it in a terminal where xonsh is available:

```sh
./fzf_albumlauncher.xsh
```

This will prompt an album selection window powered by `fzf`. After selecting an album, the script automatically handles the rest of the operations with `cmus`.

You can also set this script to a keybinding in your window manager (qtile) for quicker access.

<a name="examples" />

#### Examples

- Running the script:

```sh
./fzf_albumlauncher.xsh
```

- The user is then prompted to select an album, which will play automatically in `cmus`.

---

<a name="notes" />

### Notes

- Ensure all dependencies are installed and configured for seamless operation.
- The script saves the current queue in a temporary playlist file located at `/home/matias/.temp/nowplaying.m3u`. Ensure that this directory exists to prevent errors.

> **Critique:**
> 
> - The script does not handle cases where no album is selected. If `fzf` returns nothing, `cmus-remote` could execute with an empty query leading to potential errors.
> - Consider adding error handling for each command to improve the robustness of the script.
> - The use of hard-coded file paths (like for the playlist) might limit portability. It could benefit from using environment variables or user-defined paths.