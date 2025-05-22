# fzf Song Launcher

---

**fzf_songlauncher.sh**: Quickly choose and play a song with `cmus` using `fzf` fuzzy finder

---

### Dependencies

- `cmus-remote`  
  Command-line remote control for the cmus music player.
- `find`  
  Standard UNIX utility to search for files in a directory hierarchy.
- `fzf`  
  Command-line fuzzy finder, allows interactive selection.
- A `music` directory  
  The script assumes `music` (relative to where it's run) contains your music files.

### Description

This script provides a rapid way to browse and play songs with minimal keystrokes, leveraging fuzzy searching.

- It searches recursively for files in your `music` directory (`find -L music -type f`).  
  `-L` ensures that symbolic links are followed.
- The results are piped into `fzf`, which presents an interactive fuzzy search interface in your terminal.
- The selected file's full path is passed as an argument to `cmus-remote -f`, instructing the running cmus instance to play that file immediately.

This utility is particularly useful in a qtile environment on Arch Linux, where quick minimal interfaces are favored and scripts can be tightly integrated with keybindings.

### Usage

1. Ensure `cmus` is running in a background terminal.
2. Ensure your music files are placed inside a directory named `music` in your home or desired location.
3. Execute the script:
    ```
    /home/matias/.scripts/bin/fzf_songlauncher.sh
    ```
    Or, make it executable and call directly:
    ```
    chmod +x ~/.scripts/bin/fzf_songlauncher.sh
    ~/.scripts/bin/fzf_songlauncher.sh
    ```
4. Optionally, bind this script to a keybinding in your qtile config for instant access.

**tldr:**  
```sh
cd ~/    # directory should contain 'music'
./.scripts/bin/fzf_songlauncher.sh
```
You'll get a fuzzy file selector. Choose a song. It will play in cmus.

---

> [!TIP]
> - The `music` directory is hardcoded and relative; if run outside the intended location (e.g., from `~/`), it may not find your files. Consider making the path absolute or configurable by environment variable or argument.
> - No filetype filtering: all files in `music` are selectable—even non-audio files. Consider restricting the file types (`-iname "*.mp3"` etc.).
> - No cmus instance check: if cmus isn't running, the script fails silently.
> - A minimal usage message or error reporting would improve user feedback.