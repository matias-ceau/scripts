# Playlist Randomizer Script

---

**playlist_randomizer.xsh**: Shuffle and play albums from a playlist in a random order using cmus

---

### Dependencies

- `xonsh`: Script is written in xonsh, ensure this shell is installed.
- `pandas`: Required for handling and manipulating the playlist data.
- `random`: This standard Python library is used for shuffling the order.
- `dmenu`: Used for selecting the playlist from available options.
- `ls`, `cat`: Standard Linux utilities used for listing and reading files.
- `cmus`: A music player; the script interfaces with cmus to play music.
   
### Description

This script allows you to select a playlist of music albums and randomizes the order in which the albums are played using `cmus`. It reads playlists from a specified directory (`~/.playlists`) and uses `dmenu` to present you with a selection of available `.m3u` playlist files. The script then extracts album and song information, shuffles the albums, sorts the songs accordingly, and constructs a new playlist. This new playlist is then played through `cmus`, with the albums in random order.

The script utilizes a combination of Python libraries and Linux command-line tools to achieve its functionality. It strategically uses `pandas` to manage playlist data and `xonsh`, an alternative shell, for command execution. The `random` library helps in shuffling album order, ensuring that each playback sequence is unique.

### Usage

To execute this script:

1. Make sure the script has executable permissions:

   ```bash
   chmod +x /home/matias/.scripts/bin/playlist_randomizer.xsh
   ```

2. Run the script from the command line or set a keybinding in your qtile window manager for quick access:

   ```bash
   ./home/matias/.scripts/bin/playlist_randomizer.xsh
   ```

3. You will be prompted to select a playlist using `dmenu`. Navigate the list and make a selection.

4. The script will then randomize the album order and begin playback in `cmus`.

---

> [!TIP]
> While this script effectively randomizes albums, there is room for enhancement. For instance, integrating error handling for when `dmenu` does not return a valid selection would be beneficial. Additionally, checking if `pandas` and `xonsh` are installed prior to execution could improve user experience. Consider using environment variables or a configuration file for paths to increase flexibility.