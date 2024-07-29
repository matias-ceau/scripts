# next_album.xsh

**Script Description**

The provided script is written in the Xonsh shell and appears to be designed for use with the C-MUS (cmus) music player. The script's primary function is to skip to the next album in the current playlist when played from within a specific environment.

**Functionality Breakdown**

1. **Execute cmus-remote commands**: The script executes two `cmus-remote` commands:
	* `-C 'view 4'`: Views the fourth page of the playlist.
	* `-C 'save /home/matias/.temp/now_playing.m3u'`: Saves the current playing list to a file named "now_playing.m3u" in the specified directory.

2. **Parse saved playlist**: The script reads the saved playlist from the file and parses it into an array `now` using shell syntax.

3. **Find current album**: It then checks what song is currently being played by executing another `cmus-remote -Q` command, parsing its output to find the name of the current album.

4. **Skip to next album**: The script iterates over the list of albums in the playlist and breaks when it encounters an album that does not match the current one. It then calls `cmus-remote -n` as many times as necessary to skip to the next album.

**Usage Context**

This script is likely used within a Xonsh shell, specifically designed for interacting with cmus music player commands. The `.temp/now_playing.m3u` file seems to be specific to this user's environment and might need to be adapted if someone else wants to use this script.