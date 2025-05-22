# Album Player for cmus

---

**albumplayer.xsh**: Selects and plays a full album (with extras queued) via cmus and dmenu

---

### Dependencies

- `xonsh` &nbsp;– Required shell for running the script.
- `cmus` &nbsp;– Console music player backend.
- `dmenu` &nbsp;– Dynamic menu for fuzzy album selection.
- `cat` &nbsp;– Used to read the cmus library playlist.
- `random` (Python module) &nbsp;– Used to shuffle extra albums.
- Library file: `~/.config/cmus/lib.pl` &nbsp;– Assumes this is maintained and up-to-date with cmus library.

---

### Description

This script provides a quick way to select and play an album from your cmus library using `dmenu`. It parses your cmus library at `~/.config/cmus/lib.pl` and extracts unique album entries.  
You are presented with a dmenu-powered prompt, showing "artist — album" entries, for easy album selection. The chosen album's tracks are written to a temporary playlist file, and ten additional random albums are shuffled and appended to create a longer playback queue.  
cmus is then manipulated using its `cmus-remote` command to:

- Clear, reload, and repopulate the queue with the new album-based playlist.
- Start playback automatically.

Paths and album names are truncated and aligned for readable selection. No arguments are required; interaction is via dmenu.

---

### Usage

**Interactive selection (launch from shell or bind to key):**

```
albumplayer.xsh
```

#### TL;DR

- Maintains a temp playlist at `~/.config/cmus/.temp.m3u`
- Use dmenu to pick the album.
- Automatically loads ten additional random albums after your selection.

#### Keybinding Example for Qtile (in your qtile config):

```python
Key([mod], 'F11', lazy.spawn('~/.scripts/bin/albumplayer.xsh'))
```

---

> [!TIP]
> - The script relies on the presence and format of `~/.config/cmus/lib.pl`. If this file is missing or out-of-date, the script will not show all albums or may fail silently.
> - Extra dmenu options like `-l 300` could cause UI issues with too many or too few albums (adjust as needed).
> - String slicing and manual formatting for fancy alignment can break with unusual folder or artist names; consider using a more robust parsing method.
> - No explicit error handling: if `dmenu` selection is cancelled, or no match is found, cmus could be left in a cleared (empty) state.
> - Script may be improved by allowing configuration (playlist size, fallback if file missing, etc.) and better error feedback.