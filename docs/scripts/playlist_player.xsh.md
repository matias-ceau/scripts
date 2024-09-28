# Playlist Player Script

---

**playlist_player.xsh**: Script to pick and play a playlist using `cmus`.

---

### Dependencies

- `xonsh`: A shell language that combines Python and bash.
- `cmus`: A small, fast, and powerful console music player for Unix-like operating systems.
- `dmenu`: A dynamic menu for X, used here for selecting playlists.
- A directory named `.playlists` in the home folder containing `.m3u` playlist files.

### Description

This script is a Xonsh-based tool designed to allow the user to pick a music playlist and play it using `cmus`, a popular command-line music player. The script operates within the X11 environment using `dmenu` to provide a graphical menu for playlist selection.

The process is as follows:
1. It sets the `cmus` interface to the playlists view.
2. Clears the current playlist in `cmus`.
3. Lists all `.m3u` files from a predefined directory (`~/.playlists`).
4. Uses `dmenu` to allow the user to select one of the available playlists.
5. Once a selection is made, the selected playlist is added to `cmus`.
6. Starts playing the music from the newly added playlist.

### Usage

To use the script:

1. Ensure that you have `xonsh`, `cmus`, `dmenu`, and `.m3u` playlist files in `~/.playlists`.
2. Make sure the script is executable. You can run:

   ```bash
   chmod +x /home/matias/.scripts/playlist_player.xsh
   ```

3. Execute the script by running:

   ```bash
   ./playlist_player.xsh
   ```

You can also bind this script to a key combination in `qtile` for quick access.

---

> [!NOTE]
> While this script effectively manages playlists with `cmus`, it relies on the `.m3u` file format, which may not be updated or modified easily through this script. For an enhanced user experience, adding error handling for scenarios where no playlists are present or the `cmus` command fails would improve robustness. Additionally, consider making the playlist path configurable outside the script for greater flexibility.