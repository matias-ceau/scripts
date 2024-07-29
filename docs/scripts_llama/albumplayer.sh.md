# albumplayer.sh

**Script Description:**

This is a shell script, written in Bash, that automates the process of playing an album with the `cmus` media player.

**Functionality:**

Here's what the script does:

1. **Fetch Album List**: It uses the `beet` command-line interface to list all albums (`beet ls -a`) and pipes the output to a `sed` command to remove unnecessary characters, leaving only the album names.
2. **Display Selection Menu**: The resulting album list is then passed to the `dmenu` program (a lightweight windowed menu), which displays the options in an interactive menu.
3. **Select Album**: The user selects an album from the menu, and its name is stored in the `selection` variable.
4. **Play Selected Album**:
	* The script clears the current playlist with `cmus-remote -C clear`.
	* It then filters the album list using `cmus-remote -C 'filter album="<album_name>"'`, where `<album_name>` is the selected album name.
	* The filtered list is displayed in the `view 2` mode (`cmus-remote -C view 2`).
5. **Add Selected Album to Playlist**:
	* The script marks the selected album for addition to the playlist with `cmus-remote -C mark`.
	* It then adds the marked album to the playlist with `cmus-remote -C win-add-q`.

Overall, this script simplifies the process of playing a specific album using `cmus`, making it easier and more convenient.