# Album Player Script for cmus

---

**albumplayer.xsh**: Play a random selection of albums using cmus and dmenu

---

### Dependencies

- `cmus`: A small, fast and powerful console music player.
- `dmenu`: A fast and lightweight dynamic menu for X.

### Description

This script allows you to play a random selection of albums using `cmus`. It utilizes the configuration file located at `~/.config/cmus/lib.pl`, which contains a list of music file paths. The script extracts album information from these paths, displays the albums using `dmenu`, and then generates a temporary playlist file that is played by `cmus`.

Key functionalities include:
- Extracting unique album identifiers by parsing music paths.
- Using `dmenu` to present a list of albums to the user for selection.
- Creating a temporary `.m3u` playlist file that includes the selected album and a random selection from other albums.
- Controlling `cmus` to play the generated playlist.

### Usage

To run this script, you can execute it directly from your terminal or bind it to a key combination in your window manager (e.g., qtile). Ensure that `cmus` is running before executing the script. The script will bring up a `dmenu` interface to select the desired album.

Example command:
```sh
./albumplayer.xsh
```

You can also add this script to your qtile keybindings:
```python
Key([mod], "a", lazy.spawn("/home/matias/.scripts/albumplayer.xsh")),
```

---

> [!TIP]
> The script assumes that `cmus` is already running. You might want to add a check to start `cmus` if it isn't running. Additionally, improving error handling and edge cases such as handling empty or malformed library files could be beneficial. Consider modularizing the code for better readability and maintainability.
