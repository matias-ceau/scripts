# Next Album Skipper for cmus

---

**next_album.xsh**: Skips playback to the first track of the next album in cmus.

---

### Dependencies

- `xonsh`: Required shell interpreter for running this script.
- `cmus-remote`: Command-line control tool for the cmus music player.
- `cmus`: Music player daemon, required for playback management.
- `cat`: For reading playlist files (coreutils, likely already installed).
- Playlist location: Relies on `/home/matias/.temp/now_playing.m3u` being writable.

### Description

This script advances playback in cmus to the next album within the current queue. It does so by:

1. **Switching View**: Sets cmus view to "Playlist" mode using `cmus-remote -C 'view 4'`.
2. **Saving Playlist**: Exports the currently enqueued playlist to a temporary `.m3u` file.
3. **Parsing Playlist**: Reads the lines of this playlist, filtering out empty lines, and extracts album names (assumes directory structure: `.../Artist/Album/Track`).
4. **Getting Current Album**: Determines which album is currently playing by asking cmus for the current file and extracting the parent directory.
5. **Skipping Logic**: It iterates through the playlist as long as the album matches the current album, then skips (`cmus-remote -n`) once for each track in the current album until the next album starts.

This script is practical for large, ordered playlists (e.g., an entire discography) and when you want to quickly jump ahead to the next album boundary rather than just the next track.

### Usage

You can execute the script directly from your terminal:

```
xonsh /home/matias/.scripts/bin/next_album.xsh
```

Or make it executable and run it:

```
chmod +x ~/.scripts/bin/next_album.xsh
~/.scripts/bin/next_album.xsh
```

#### Qtile Integration

For fast access, add a keybinding in your Qtile config:

```python
Key([mod], "period", lazy.spawn("xonsh /home/matias/.scripts/bin/next_album.xsh"), desc="Skip to next album in cmus")
```

---

> [!TIP]
> - The script assumes music directory structures with `/Artist/Album/Track`—if your library layout is different, album detection may not be accurate.
> - There is no error handling for missing or empty playlist files, or for when cmus isn't running.
> - Consider using `os.path` utilities for more robust path parsing in Xonsh instead of raw string splitting.
> - Adds a dependency on a hardcoded temp file; using `/tmp` is safer and avoids potential permission issues.
> - For larger playlists, repeated skipping via `cmus-remote -n` can be slow. If cmus gains better album skip support in future, update this logic.