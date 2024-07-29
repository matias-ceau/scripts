# albumplayer.xsh

This script is written in xonsh, a Unix-like shell language that runs on top of Python. It's designed to play an album using the `cmus` music player and its remote control interface.

**Functionality:**

1. The script retrieves a list of music file paths from a custom configuration file (`lib.pl`) located in the user's `.config/cmus/` directory.
2. It filters these paths to get a list of albums, by splitting each path and taking the last two directories (i.e., `album_name/artist_name`).
3. The script then creates a "fancy" dictionary with album names as keys and tuples containing the artist name and album title as values. This is done using a dictionary comprehension that formats each value to display only 100 characters of the artist name.
4. The user is presented with a list of these fancy albums using `dmenu`, a lightweight window manager-independent dialog for displaying menus.
5. Once an album is selected, the script generates a playlist by finding all music files in the `lib.pl` configuration file that belong to the same artist as the selected album.
6. It shuffles the remaining albums (not part of the original selection) and appends their corresponding music files to the playlist.
7. The playlist is written to a temporary file (`~/.config/cmus/.temp.m3u`) for later use by `cmus`.
8. Finally, the script uses `cmus-remote` commands to:
	* Update `cmus` with the new playlist
	* Clear any existing playlist
	* View the new playlist in a custom way (using `view 4`)
	* Quit `cmus`

This script appears to be designed for users who want to play music albums using `cmus`, and it uses a combination of Python, xonsh, and `dmenu` to provide an interactive interface for selecting albums and generating playlists.