# Next Album Skip

---

**next_album.xsh**: A script to skip to the next album in `cmus`

---

### Dependencies

- `cmus`: A lightweight, console-based music player that this script interfaces with.
- `xonsh`: A Python-powered shell used to run the script.

### Description

The `next_album.xsh` script is designed for use with `cmus`, a terminal-based music player. This script is written in `xonsh`, a shell combining Python with shell language aspects.

The primary functionality of this script is to skip to the next album in the current playlist. It first sets the view to '4', which corresponds to the playlist view in `cmus`, and saves the current playlist to a temporary `.m3u` file. The file is read, and each track's directory path is parsed to identify albums. 

The script compares the current album playing (retrieved through `cmus-remote -Q`) against the list of albums identified in the playlist. Once it finds an album that differs from the current one, it uses `cmus-remote -n` to skip tracks until the first track of the next album is reached.

### Usage

To use this script, ensure you have `cmus` and `xonsh` installed and are running. The script can be executed from a terminal. It can be associated with a key binding in your `qtile` window manager or executed automatically. 

```shell
xonsh /home/matias/.scripts/next_album.xsh
```

For convenience, consider mapping this script to a key binding within `qtile` for quick access during playback.

---

> [!NOTE]
> The script assumes that the tracks in the playlist are ordered by album. If modifications occur in the playlist structure, behavior might be erratic.
> A potential improvement could be handling exceptions in cases where files or directories aren't found, or when `cmus` isn't running. Moreover, storing paths or configurations in the script is inflexible; consider using environment variables or configuration files to make paths more adaptable.