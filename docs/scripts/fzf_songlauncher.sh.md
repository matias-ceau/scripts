# FZF Song Launcher

---

**fzf_songlauncher.sh**: Quickly play a song with cmus using fzf for selection

---

### Dependencies

- `cmus`: A fast and powerful command line music player.
- `fzf`: A command-line fuzzy finder, used here for selecting the song.
- `find`: A Unix command for searching files in a directory hierarchy.

### Description

This script integrates `cmus`, a versatile command-line music player, with `fzf`, a fuzzy finder, to create a quick and efficient way to select and play music files directly from your terminal. The script uses the `find` command to search through the 'music' directory and list all files, including those in subdirectories. The `-L` option in `find` allows symbolic links to be followed, while `-type f` specifies that only files should be listed.

### Usage

To use this script, ensure you have `cmus` and `fzf` installed on your Arch Linux system. You can run the script directly from your terminal. It's designed to be executed in a shell environment and can be bound to a key combination in your qtile window manager for quick access.

#### Example:

```sh
/home/matias/.scripts/bin/fzf_songlauncher.sh
```

This command will open an `fzf` interface listing all music files in the 'music' directory. Use the fuzzy search capabilities of `fzf` to find the desired song. Once selected, the song will be played using `cmus`.

---

> [!WARNING]
> This script assumes the 'music' directory is located in the current working directory. Consider modifying the script to use an absolute path or adjust the working directory logic to fit your personal music library structure. Additionally, error handling for cases when the 'music' directory is inaccessible or empty could improve the robustness of this script.