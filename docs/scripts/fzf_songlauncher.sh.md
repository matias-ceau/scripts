# FZF Song Launcher

---

**fzf_songlauncher.sh**: Select and play a song using `cmus`, with `fzf` for interactive selection.

---

### Dependencies

- `cmus-remote`: A command-line tool to control cmus, a feature-rich music player.
- `find`: Unix command for searching files in a directory hierarchy.
- `fzf`: A general-purpose command-line fuzzy finder, used here to interactively select a song.
- Directory: The script expects a directory named `music` that contains the audio files.

### Description

This script provides a streamlined way to select and play music files using a combination of powerful command-line tools available on Arch Linux. It utilizes `find` to search files within the `music` directory and `fzf` to present a fuzzy-search interface, allowing the user to quickly find and select a song to play. The selected song path is then fed into `cmus` via `cmus-remote` to start playback. The use of symbolic links is explicitly enabled by `find` with the `-L` flag, ensuring that linked music files are also considered in the search.

### Usage

This script is designed to be run from the terminal or integrated into your qtile keybindings for quick access. Here’s how to use it:

1. **Run the Script**: Execute the script from the terminal.
   ```bash
   ~/.scripts/fzf_songlauncher.sh
   ```

2. **Select a Song**: A list of music files will appear via `fzf`. Begin typing to filter the list, and press `Enter` to select a song. The playback will begin immediately through `cmus`.

To integrate with qtile, you could bind the script to a keystroke in your `config.py` like this:

```python
Key([mod], "m", lazy.spawn("~/.scripts/fzf_songlauncher.sh")),
```

---

> [!TIP]
> - Ensure the `music` directory is properly populated with accessible music files. The script doesn't account for music stored in other directories or system-wide music paths.
> - Consider adding error handling to manage cases where `cmus` is not running or if `fzf` doesn't select a file. This would make the script more robust.