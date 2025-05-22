# Song Launcher – Play Songs in cmus via dmenu

---

**songlauncher.sh**: Quickly search and play music files via dmenu and cmus

---

### Dependencies

- `cmus-remote`  
  Command-line client for the cmus music player, allows remote control of cmus (must be running).
- `find`  
  Standard Unix utility for recursively searching directories.
- `dmenu`  
  Dynamic menu utility; displays a list of items and outputs the user's choice.
- Your `music` directory  
  Assumes you have a folder named `music` in your working directory containing music files.

### Description

This script enables rapid fuzzy searching and playback of songs with your Arch Linux and qtile setup.  
It leverages the `find` command to recursively list all files in (or beneath) the `music` directory, then pipes this list to `dmenu -i -l 30`. The `-i` flag makes dmenu case-insensitive, and `-l 30` displays up to 30 choices.

Once you select a file in dmenu, it is fed as an argument to `cmus-remote -f`, which tells cmus to load and play the selected song file immediately.

- Assumes `cmus` is running in the background (or in another terminal).
- Designed to be lightning-fast and minimal; perfect for integration as a keybinding or launcher in qtile.
- The music path is relative; best used from your home directory or adjust as needed.

### Usage

To use the script:

1. Ensure you have `cmus` running.
2. Launch the script from your shell, a launcher, or assign to a qtile keybinding.

Basic invocation example:

```
$ ~/scripts/bin/songlauncher.sh
```

**Typical keybinding integration:**

In your qtile config:
```python
Key([mod], 's', lazy.spawn('~/.scripts/bin/songlauncher.sh'))
```

> Running the script will present a searchable (case-insensitive) list of all files in your `music` directory. Select one, press Enter, and playback will start in cmus.

---

> [!IMPORTANT]
> - The script assumes the current working directory contains the `music` folder. Consider using an absolute path (e.g., `~/music`) to avoid confusion or breakage if run from elsewhere.
> - No file-type filtering is in place; if you have non-audio files in `music`, they will also appear.
> - To improve, you might:
>    - Add filtering for audio file extensions (like `.mp3`, `.flac`, etc.).
>    - Check if `cmus` is running, and optionally launch it if not.
>    - Support for configurable music directories via an environment variable or command-line argument.