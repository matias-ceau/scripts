# Playlist Randomizer (playlist_randomizer.xsh)

---

Pick a playlist of albums and play in random order in cmus.

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

- xonsh: A Python-powered shell 
- pandas: For handling datasets
- cmus: A music player (command line)
- dmenu: For interactive menu selection

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `playlist_randomizer.xsh` script is designed to facilitate the random playback of playlists in the cmus music player on an Arch Linux system. The script operates as follows:

1. It reads a directory of playlists stored in `~/.playlists`, specifically looking for `.m3u` files.
2. The user is presented with a dmenu interface to select one of the playlists.
3. The selected playlist file is parsed to retrieve the albums and songs.
4. The script shuffles the album order and prepares a new randomized playlist.
5. Finally, it sends commands to cmus to clear existing songs, add the newly randomized playlist, and start playback.

This effectively allows a user to enjoy a refreshing and random music experience from their selected playlist.

---

<a name="usage" />

#### Usage

To use this script, ensure you have all the required dependencies installed and execute it in a terminal with the following command:

```bash
./playlist_randomizer.xsh
```

You can also bind this script to a key combination in your window manager, allowing for quick access to re-randomize and play playlists without switching windows.

<a name="examples" />

#### Examples

1. Execute the script to bring up your playlist selection:

   ```bash
   ./playlist_randomizer.xsh
   ```

2. Choose a playlist when prompted by dmenu. The songs will play in a random order.

---

<a name="notes" />

### Notes

- Ensure that your playlists are properly formatted `m3u` files located in `~/.playlists`.
- The script requires access and proper permissions for cmus to interact with its remote commands.
- The temporary randomized playlist is saved in `/home/matias/.temp/randomized.m3u`, make sure this directory exists.

> **Critique:** The script effectively randomizes albums within a playlist and communicates with cmus efficiently. However, error handling can be improved, especially around the selection and parsing of the playlist files. Adding checks for empty selections and handling potential exceptions, such as file access issues, would enhance its robustness. Additionally, a cleanup procedure for the temporary playlist could be included to ensure no unnecessary files clutter the temp directory.