# Random Album Selector and Player

---

**random_album.xsh**: Selects a random album from your music library and plays it with `cmus`

---

### Dependencies

- `xonsh`: A shell language that combines Python and Bash.
- `cmus-remote`: Command-line music player control for `cmus`.
- Music library path configured in `~/.config/cmus` and an existing `lib.pl` file containing music file paths.

### Description

This script utilizes the power of the `xonsh` shell and the `cmus` music player to randomly select and play an album from your music library. It reads your music library paths from the `~/.config/cmus/lib.pl` file, which lists all track or file paths. The script first cleans `cmus` by clearing any existing playlists.

The script then shuffles the list of albums and selects a random set of 10 albums to create a temporary playlist. This playlist is stored as `.temp.m3u` in your `cmus` configuration directory. The script uses `cmus-remote` to queue, play, and skip tracks in the shuffled album list.

### Usage

To use this script, ensure you have a properly configured `cmus` library:

1. **Run the script**: Execute the script in a terminal with `xonsh` shell either directly or integrate it into your workflow, like assigning it to a keyboard shortcut in your qtile WM.

```shell
xonsh /home/matias/.scripts/bin/random_album.xsh
```

2. **Integration in qtile**: You can bind this script to a key combination in your `qtile` configuration file, enabling quick access to random album playback.

---

> [!TIP]
> Consider checking that `.config/cmus/lib.pl` exists and has up-to-date paths to avoid playing nonexistent files.
> You might want to include error handling to ensure `cmus-remote` commands do not fail silently.
> Additionally, optimizing the selection and playlist generation can be beneficial, especially if dealing with a very large library.