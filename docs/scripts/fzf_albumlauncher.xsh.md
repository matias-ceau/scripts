# Fzf Album Launcher

---

**fzf_albumlauncher.xsh**: Select and play an album using `fzf` and `cmus` on Arch Linux with qtile WM

---

### Dependencies

- `xonsh`: A shell language that powers the script.
- `beet`: Command-line music tagger and library organizer to retrieve album listings.
- `cmus`: A small, fast, and powerful console music player for playing the albums.
- `sed`: A stream editor used for transforming text in scripts.
- `fzf`: A command-line fuzzy finder to select an album.

### Description

The **fzf_albumlauncher.xsh** script allows you to choose an album from your music library and play it using the `cmus` music player. It utilizes `beet` to fetch a list of albums, processes it with `sed` to format the album names correctly, and then employs `fzf` for a user-friendly album selection. Once an album is selected, it interacts with `cmus` using `cmus-remote` commands to set up the album playlist, clear previous filters, and initiate playback. Finally, it saves the currently playing queue to a temporary file located at `/home/matias/.temp/nowplaying.m3u`.

### Usage

To run the script, you need to have the necessary dependencies installed and configured properly. Execute the script in an interactive terminal:

```shell
xonsh /home/matias/.scripts/bin/fzf_albumlauncher.xsh
```

- The script does not require any command-line arguments.
- Select an album interactively using `fzf`.
- Upon selection, the script sets up and begins playback in `cmus`.

This script can be linked to a keybinding in a tiling window manager like qtile for convenience, allowing you to launch it quickly without having to locate and execute it from the terminal.

---

> [!TIP]
> - Ensure that `cmus` is running because the `cmus-remote` commands require an active session.
> - The script assumes that your music library is already managed by `beet`. Ensure that `beet` functions correctly and that your library database is up-to-date for best results.
> - Consider wrapping the execution in some error handling to manage cases when `cmus` is closed, or no album is selected, to improve robustness.