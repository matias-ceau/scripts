# playlist_randomizer.xsh

This script is a shell script written in Xonsh, which appears to be a Unix-like shell. It's designed to interact with the `cmus` (a console music player) and the `dmenu` (a dynamic menu system for choosing options). Here's what it does:

**Functionality:**

1. **Choose an album playlist**: The script lists available playlists in the `~/.playlists` directory and prompts the user to choose one using `dmenu`. It selects the chosen playlist.
2. **Load song metadata**: It loads the selected playlist (a `.m3u` file) into a Pandas DataFrame, which contains information about each album and song.
3. **Randomize albums**: The script randomizes the order of the albums in the dataframe using `random.shuffle`.
4. **Create a randomized playlist**: It creates a new `.m3u` file called `randomized.m3u` by mapping the shuffled album order to the corresponding songs from each album and sorting them.
5. **Play the randomized playlist**: The script uses `cmus-remote` commands to:
	* Clear any existing playlist
	* Add the newly created `randomized.m3u` file as a new playlist
	* Start playing the playlist using `cmus`

**Notes:**

* The script assumes you have `dmenu`, `cmus`, and Xonsh installed on your system.
* It also expects a specific directory structure with playlists stored in `~/.playlists`.
* The script uses some environment-specific paths (`/home/matias`) which may need to be adapted for other users.

Overall, this script is designed to automate the process of creating a randomized playlist using CMUS and selecting an album playlist interactively.