# playlist_player.xsh

**Script Description**

The provided script is a shell script written in xonsh (a Unix-like scripting language) that automates the process of selecting and playing a playlist with the Music Player Daemon (MPD), specifically the cmus client.

**Functionality**

1. **Setting up playlists path**: The script sets the `PLAYLIST_PATH` variable to the user's home directory, followed by `~/.playlists`.
2. **Listing available playlists**: The script uses `os.listdir()` to list all files in the specified playlist directory (`PLAYLIST_PATH`). It then filters the results to include only files with a `.m3u` extension (the file format for M3U playlists) and extracts the filename without the extension using a list comprehension.
3. **Displaying playlist options**: The script uses `dmenu` (a dynamic menu launcher) to display a list of available playlists in a GUI dialog. The list is sorted alphabetically before being displayed.
4. **Choosing a playlist**: The user selects a playlist from the displayed list by interacting with the `dmenu` dialog.
5. **Adding selected playlist to cmus**: Once a playlist is chosen, the script uses `cmus-remote` (the remote control for cmus) to add the selected M3U file to the current music player queue. The `-C` option specifies a command to execute, and the `f'add {PLAYLIST_PATH}/{choice}.m3u'` string is used as a template to insert the chosen playlist path.
6. **Playing back**: Finally, the script uses `cmus-remote -n` to start playing the music in the selected playlist.

In summary, this script provides an interactive way for users to select and play a M3U-based playlist with cmus.