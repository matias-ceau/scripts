# Random Album Player with cmus

---

**random_album.xsh**: Selects a random album from cmus library and plays it using cmus.

---

### Dependencies

- `xonsh`: A Python-powered, bash-compatible shell.
- `cmus`: A small, fast and powerful console music player.
  
### Description

This script selects a random album from your cmus music library and plays it using cmus. It operates by first reading the `lib.pl` file of cmus, which contains the indexing of all available tracks. Out of this list, it parses and randomizes the albums, selecting ten of them. The selected albums' track paths are then compiled into a temporary playlist file located at `~/.config/cmus/.temp.m3u`. This temporary playlist is subsequently loaded and played by cmus through `cmus-remote`, a utility to control cmus from an external script. 

### Usage

To use this script, ensure it's executable and can be run from within a terminal that supports `xonsh`. It is designed to be used directly from the shell environment or could be bound to a shortcut key within the qtile window manager for easier access. Here's how to do it, step by step:

1. **Run the script directly**:
   ```bash
   ~/.scripts/random_album.xsh
   ```

2. **Bind in qtile**: Add a keybinding in your `config.py` file like so:
   ```python
   Key([mod], 'r', lazy.spawn('xonsh ~/.scripts/random_album.xsh')),
   ```

After running, the script will clear the existing cmus playlist if opened, shuffle the random album list, and proceed to play the first track of the first random album selected.

---

> [!TIP]
> This script could be improved by adding error handling, particularly for the lines where it reads from `lib.pl` and writes to `~/.config/cmus/.temp.m3u`. If these files do not exist or if there are file permission issues, the script might fail. Additionally, better handling of cases where there are fewer than ten albums in the library would ensure more robust execution.