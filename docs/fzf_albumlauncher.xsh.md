# fzf_albumlauncher.xsh

**Script Description**

This script is a shell script written in Xonsh, a Unix shell designed for productivity. It appears to be a music-related script that interacts with the `cmus` and `beet` tools.

**Functionality**

The script performs the following steps:

1. **List albums**: The script uses `beet ls -a` to list all available albums.
2. **Filter albums with fzf**: The output is then piped to `fzf`, a command-line fuzzy finder, which allows the user to select an album by typing its name or part of it.
3. **Get selected album**: The selected album's title (without any preceding text) is stored in the `selection` variable using `.strip()`.
4. **Play selected album**:
	* The script plays the selected album with `cmus-remote`, a command-line interface for controlling the cmus music player.
	* It first clears the current playback queue (`clear`) and then views the queue to ensure it's empty (`view 2`).
	* A query is constructed using the selected album's title, which is used to filter the current playlist (`filter album="{selection}"`).
	* The script marks the filtered track for playback (`mark`) and adds it to the current playback queue (`win-add-q`), filters out any other tracks (`filter`), and then views the new playback queue again (`view 4`).
5. **Save current playback**:
	* Finally, the script saves the current playback information (including the selected album) to a file named `nowplaying.m3u` in the user's home directory using `cmus-remote`.

Overall, this script allows users to quickly select an album using fzf and then play it with cmus, while also saving the current playback information.