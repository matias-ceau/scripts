# albumplayer.xsh

This script is written in Xonsh, a Unix shell scripting language that provides a Python-like syntax. Here's an explanation of its functionality:

**Purpose:**

The script plays an album using the `cmus` music player and generates a playlist with tracks from the selected album and related albums.

**Flow:**

1. The script loads a list of file paths from the `.config/cmus/lib.pl` file, which is assumed to contain a list of song files.
2. It extracts the album names from these file paths by splitting each path into its constituent parts (e.g., `/path/to/album/title/song.mp3`) and extracting the title part (`album/title`).
3. The script creates a dictionary `fancy_dict` where each key is an album name, and the value is a tuple containing the artist name and the album title.
4. It generates a list of album names with their corresponding artist and title information in a formatted string.
5. The script presents this list to the user through `dmenu`, a lightweight menu system, allowing them to select an album.
6. If an album is selected, the script generates a playlist by finding all files that belong to the selected album and its related albums (up to 10 related albums are considered).
7. It writes the generated playlist to a temporary file (`~/.config/cmus/.temp.m3u`) and instructs `cmus` to play it using various remote control commands.

**Assumptions:**

This script assumes that:

* The `.config/cmus/lib.pl` file contains a list of song files, one per line.
* The file paths in the library file are properly formatted (e.g., `/path/to/album/title/song.mp3`).
* The `cmus` music player is installed and configured on the system.
* The user has dmenu installed and configured to display the menu.

Overall, this script appears to be a custom solution for playing albums with related tracks using `cmus`, leveraging the power of Xonsh scripting.