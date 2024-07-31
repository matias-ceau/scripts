# Playlist Player (playlist_player.xsh)

---

A script to select and play a playlist using cmus.

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

- **cmus**: A small and powerful console music player.
- **dmenu**: A dynamic menu for X, used for selecting playlists.
- **xonsh**: A shell language that combines Python and Bash.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `playlist_player.xsh` script is designed to enhance the user experience of the cmus music player by allowing users to easily select and play their music playlists. Upon execution, the script presents a list of available playlists in the user’s `~/.playlists` directory through a graphical menu provided by `dmenu`.

The script performs the following steps:
1. Opens the specified view in cmus to prepare the interface for playlist management.
2. Clears any currently loaded songs in cmus to provide a fresh start.
3. Gathers the available playlists by reading from the `~/.playlists` directory, filtering for files with an `.m3u` extension.
4. Displays the sorted list of playlists using `dmenu`, allowing the user to select one.
5. Loads the selected playlist into cmus and starts playback.

---

<a name="usage" />

#### Usage

To use the script, simply execute it in your terminal. Ensure you have the necessary dependencies installed. You may also bind this script to a keyboard shortcut in your window manager (qtile) for quick access:

```bash
~/.scripts/playlist_player.xsh
```

Alternatively, create a key binding in your `config.py` as follows:

```python
Key([mod], "p", lazy.spawn("~/.scripts/playlist_player.xsh")),
```

<a name="examples" />

#### Examples

1. Run the script from the terminal:
   ```bash
   ~/.scripts/playlist_player.xsh
   ```
2. Select a playlist from the menu shown by `dmenu`.
3. The selected playlist will load and start playing immediately upon selection.

---

<a name="notes" />

### Notes

- Ensure your playlists are saved in the `~/.playlists` directory with the `.m3u` extension.
- The script assumes cmus is installed and working correctly.

> **Critique:**
> 
> While the script is functional, it could benefit from additional error handling, such as confirming the existence of the `~/.playlists` directory and handling the case where no playlists are available. Additionally, incorporating options for pausing or stopping the playback after selecting a playlist could enhance usability.