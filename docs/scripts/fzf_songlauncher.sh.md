# fzf Song Launcher

---

**fzf_songlauncher.sh**: Play a song with cmus (choose it with fzf)

---

### Dependencies

- `cmus`: A powerful music player for Unix-like systems.
- `fzf`: A command-line fuzzy finder, used to interactively select a song from a list.

### Description

The `fzf_songlauncher.sh` script is designed to enhance your music listening experience by leveraging the combination of `cmus` and `fzf`. This powerful pair allows users to quickly find and play songs stored in the `music` directory.

- The script uses the `find` command to search for all music files recursively in the specified directory.
- The results are piped to `fzf`, which provides an interactive interface for users to select their desired song.
- Once the user makes a selection, the script invokes `cmus-remote` to play the chosen track.

### Usage

To use the script, simply run it from your terminal. The following command will execute the script:

```bash
bash /home/matias/.scripts/fzf_songlauncher.sh
```

Upon execution, a `fzf` interface will open, allowing you to browse and select a song to play. After selection, `cmus` will start playing the chosen song.

You can also make this script accessible via a keybinding in your window manager or terminal emulator, allowing for faster and more convenient access. 

For example, you could add a keybinding in `qtile` to execute this script.

```python
# Example qtile config snippet
Key([mod], 'p', lazy.spawn('/home/matias/.scripts/fzf_songlauncher.sh')),
```

---

> [!TIP] 
> Consider adding error handling to your script. For instance, check if the `music` directory exists before running the `find` command, and handle cases where no files are found to improve user experience. Additionally, you might want to allow the user to specify a different music directory as a command-line argument. This will make your script more versatile.