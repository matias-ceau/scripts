# random_album.xsh

**Script Description:**

This is a Xonsh script, which is a Unix shell that allows users to write scripts using Python syntax. The script is designed to select a random album from a library of music and create a playlist with 10 songs from that album.

**Functionality:**

Here's what the script does:

1. **Import necessary modules**: The script imports the `random` and `os` modules, which are used for generating random numbers and interacting with the operating system, respectively.
2. **Define temporary file path**: The script defines a temporary file path where it will store the generated playlist.
3. **Clear and set cmus view**: The script uses `cmus-remote`, a command-line interface for the music player CMUS, to clear any current playlists and set the view to a list of albums (view 4).
4. **Get library paths**: The script reads the contents of a file named `lib.pl` in the `.config/cmus/` directory and splits it into individual lines. These lines represent paths to music files.
5. **Generate unique album names**: The script creates a set of unique album names by iterating over the list of paths and extracting the last two components (i.e., the album name). It then shuffles this set using `random.shuffle`.
6. **Create playlist**: The script loops through each album in the shuffled set and selects 10 songs from that album based on their paths. These song paths are appended to a list.
7. **Write playlist to temporary file**: The script writes the generated playlist to the temporary file defined earlier.
8. **Play the playlist**: Finally, the script uses `cmus-remote` to play the generated playlist.

In summary, this script generates a random album and creates a playlist with 10 songs from that album using CMUS as the music player.