# Playlist Player Script

---

**playlist_player.xsh**: Select and play a playlist using `cmus` and `dmenu` on Xonsh shell

---

### Dependencies

- `xonsh`: A Python-powered, Unix-gazing shell language and command prompt.
- `cmus`: A small, fast and powerful console music player for Unix-like operating systems.
- `dmenu`: A dynamic menu for X, originally designed for `dwm`.

### Description

This script allows you to select and play a music playlist formatted in `.m3u` using `cmus`, a console music player. The script is written in the `xonsh` shell, chosen for its Python-based scripting abilities. Here's a breakdown of what the script does:

1. **Set Up Environment**: It sets a path to where your playlists are stored in the variable `PLAYLIST_PATH`.
2. **Playlist Selection**: The script fetches all `.m3u` playlist files within the specified `PLAYLIST_PATH`, removes the file extension, and presents them as options using `dmenu`.
3. **Cmus Operations**: 
   - Switches to the fourth view in `cmus` using `cmus-remote -C 'view 4'`, which is typically playlists.
   - Clears any currently queued tracks using `cmus-remote -C clear`.
   - Adds the chosen playlist to `cmus` via `cmus-remote -C add`.
   - Attempts to skip to the next track with `cmus-remote -n` and begins playback with `cmus-remote -p`.

### Usage

Ensure all dependencies are installed on your Arch Linux system. You can run the script directly from a terminal or bind it to a key in your qtile window manager.

```bash
~/.scripts/bin/playlist_player.xsh
```

### Configuration

To bind this script to a key in `qtile`, add an entry to your `qtile` configuration file like so:

```python
Key([mod], "p", lazy.spawn('~/.scripts/bin/playlist_player.xsh')),
```

This setup allows you to press `mod+p` to launch the playlist player and choose your favorite music directly from `dmenu`.

---

> [!TIP]
> A potential improvement is to enhance error handling when playlist files are not found or `cmus` fails to start playback. Additionally, since `dmenu` is invoked here, ensure it is set to a visible and appropriate location/configuration proportionate to your screen size and resolution.