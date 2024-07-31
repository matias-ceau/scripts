# Playlist Randomizer (playlist_randomizer.xsh)

---

Randomly selects and plays albums from a specified playlist in cmus.

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

- xonsh
- pandas
- cmus
- dmenu

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `playlist_randomizer.xsh` script provides a convenient way to select a playlist of albums and play them in a random order using the cmus music player. This is achieved through the use of the `xonsh` shell, which allows for easy integration of Python code alongside shell commands.

**Procedure:**
1. It lists available `.m3u` playlists located in the `~/.playlists` directory.
2. A playlist is selected using `dmenu`, which displays a list of options in a user-friendly interface.
3. The contents of the selected playlist are read, filtering out any empty lines.
4. Albums and songs are extracted for shuffling.
5. The individual albums are shuffled randomly, while maintaining the order of songs within each album.
6. The shuffled playlist is saved temporarily, and then loaded into cmus for playback.

---

<a name="usage" />

#### Usage

To use the script, simply execute it within your terminal session. Ensure you have `xonsh`, `pandas`, `cmus`, and `dmenu` installed on your Arch Linux setup. You can link this script to a keyboard shortcut in your window manager to make it more accessible. 

Run the script with:
```
./playlist_randomizer.xsh
```

Make sure the `PLAYLIST_PATH` variable points to the correct directory where your `.m3u` playlists are stored.

<a name="examples" />

#### Examples

- To randomly play songs from a specific playlist, run:
```
./playlist_randomizer.xsh
```
A dmenu will appear listing all available playlists.

---

<a name="notes" />

### Notes

- Make sure the `~/.playlists` directory contains `.m3u` files properly formatted.
- This script requires cmus to be running to properly enqueue the songs.

> **Critique:** 
> - Consider adding error handling to manage cases where no playlists exist or if the cmus player is not running. 
> - The script structure could be improved by separating the logic of reading playlists and randomizing orders into different functions for better readability and reusability.
> - Instead of echoing to a temporary file, consider using cmus's built-in capabilities for handling dynamic playlists directly if available.