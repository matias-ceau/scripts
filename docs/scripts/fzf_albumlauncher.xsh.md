# fzf Album Launcher

---

**fzf_albumlauncher.xsh**: Quickly search for and play an album in cmus using fzf and beets.

---

### Dependencies

- `xonsh`: This script must be run in the xonsh shell.
- `fzf`: Command-line fuzzy finder for selecting your album.
- `beet` (`beets`): Used to list albums in your music library.
- `cmus-remote`: Controls the cmus music player from the command line.
- `sed`: Used here for string manipulation in the album list.
- `cmus`: (as a backend for `cmus-remote`).
- (Optionally) `/home/matias/.temp/` folder: for storing `nowplaying.m3u` playlist.

### Description

This script provides a fast way to pick an album and queue it for playback in `cmus`. It uses `beet ls -a` to list all albums, then `sed` to clean up the display format, followed by `fzf` for fuzzy-search and selection.

Upon selection:
- Switches cmus to album view for clean state.
- Clears cmus' current queue.
- Sets the view, applies a filter to match the selected album, marks and adds the tracks to the queue.
- Resets the filter, returns to the library view, limits queue to 100 songs, advances track, starts playback.
- Saves the now playing queue to `nowplaying.m3u` for persistent or external use.

Scripted efficiently to be called from a hotkey or a terminal.

### Usage

You can run this in a terminal or bind it to a key combination in qtile for instant access to album-queued playback.

```sh
xonsh /home/matias/.scripts/bin/fzf_albumlauncher.xsh
```

Or, if this script is in your `$PATH` and executable:

```sh
fzf_albumlauncher.xsh
```

**tldr:**
```
# Fuzzy-search and play a full album instantly
fzf_albumlauncher.xsh
```
No arguments required. Select your album interactively via `fzf`, and playback/queue happens automatically in `cmus`.

---

> [!TIP]
> This script works reliably if your album metadata is good and the `beet` index is synced. However, error handling is minimal: if you cancel the selection in `fzf`, or if an album name includes problematic characters, you might see failures or unexpected behavior. Consider adding checks for empty selection, and possibly escaping quotes in album names for the `filter` command. Additionally, hardcoding the `.temp` path and output filename may result in errors if the directory does not exist—make sure `/home/matias/.temp/` is present.
