# FZF Album Launcher

---

**fzf_albumlauncher.xsh**: Choose an album with fzf and play it with cmus

---

### Dependencies

- `xonsh`: A shell that executes the script.
- `beet`: Music library manager used to list albums.
- `fzf`: Command-line fuzzy finder utilized to select an album.
- `cmus`: Console music player used for playing the selected album.
- `cmus-remote`: Command tool for controlling `cmus` operations.

### Description

This script is designed for selecting and playing albums using a command-line interface on an Arch Linux system with the qtile window manager. It leverages the `beet` command to list all albums available in the music library, then uses `fzf` to allow the user to interactively choose an album. Once an album is selected, it controls `cmus` through `cmus-remote` to play it.

The script executes several `cmus-remote` commands to ensure that the playlist is cleared, the album is filtered and marked, it gets queued with the specified number of tracks, and starts playing immediately. It also saves the currently playing albums' playlist as `nowplaying.m3u` in the specified directory for future reference.

### Usage

To use this script, simply execute it in a terminal that supports `xonsh`:

```shell
~/.scripts/fzf_albumlauncher.xsh
```

This script isn't designed with any command-line arguments. It could be bound to a keybinding within your qtile configurations for quick access or just executed when you open a terminal session. It executes interactively, presenting you with a list of albums to choose from using `fzf`.

```shell
# Example of keybinding in qtile:
keys = [
    Key([mod], 'm', lazy.spawn('~/.scripts/fzf_albumlauncher.xsh')),
    # other keybindings...
]
```

---

> [!TIP]
> Currently, the script only handles albums and captures their name using simplistic `sed` operations which could potentially lead to unexpected behaviors with non-standard album naming conventions. Consider implementing more robust error handling or album name sanitization. Additionally, the script could be improved by confirming whether `cmus` is already running or starting it in the absence to avoid any control command failures.