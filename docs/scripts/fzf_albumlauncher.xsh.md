# FZF Album Launcher

---

**fzf_albumlauncher.xsh**: Choose an album with `fzf` and play it with `cmus`.

---

### Dependencies

- `xonsh`: A shell scripting language, designed for use in a shell environment.
- `beet`: Music library manager.
- `sed`: Stream editor for filtering and transforming text.
- `fzf`: Command-line fuzzy finder, used to select albums.
- `cmus`: C* Music Player, a small, fast and powerful console music player.
- `cmus-remote`: Remote control utility for cmus.

### Description

This script is designed to work in an Arch Linux environment using the qtile window manager. It uses `fzf`, a fuzzy finder, to let users select an album from their music library, managed by `beet`. Once an album is selected, it will be played in `cmus`.

The script utilizes `sed` to manipulate output by stripping unnecessary text and `cmus-remote` commands to control playback in `cmus`. It follows these general steps:
1. Lists albums using `beet`.
2. Uses `sed` to clean up the list format.
3. Allows the user to choose an album using `fzf`.
4. Controls `cmus` to play the selected album.

### Usage

To use this script, ensure that `xonsh`, `beet`, `sed`, `fzf`, `cmus`, and `cmus-remote` are installed. Run the script interactively in the terminal.

```shell
./fzf_albumlauncher.xsh
```

Then, an interactive `fzf` search will be displayed where you can select an album.

Example:

- Run the script and search for an album.
- Select an album using the interface provided by `fzf`.
- The album will then be automatically queued and played in `cmus`.

You can also bind it to a key combination in `qtile` by specifying this script's path in your keybindings configuration.

---

> [!TIP]
> Ensure that all dependencies are properly installed and configured, especially `beet`, which needs to be set up to manage your music library. Additionally, this script assumes a specific file path for saving playlists (`/home/matias/.temp/nowplaying.m3u`). Consider making the path configurable to increase flexibility.