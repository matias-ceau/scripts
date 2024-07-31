# FZF Song Launcher

---

**[fzf_songlauncher.sh](/fzf_songlauncher.sh)**: Play a song with cmus using fzf to choose the file.

---

### Dependencies

- `cmus`: A small, powerful console music player for Unix-like operating systems.
- `fzf`: A general-purpose command-line fuzzy finder that makes it easier to select files interactively.

### Description

The `fzf_songlauncher.sh` script is a simple yet effective tool for users of `cmus` who want to quickly select and play a song from their music library. Using `fzf`, the script presents a fuzzy search interface that makes it easy to find audio files.

When executed, this shell script utilizes the `find` command to recursively search for files within the 'music' directory. The result is piped into `fzf`, providing an interactive listing of song files. The user can navigate through this list to select a song. The chosen file's path is then sent to `cmus-remote` with the `-f` flag to play the selected song.

### Usage

To use the script:
1. Ensure that you have both `cmus` and `fzf` installed on your Arch Linux system.
2. Place the script somewhere in your PATH to enable easy execution, or run it directly from its directory.
3. Make sure the `music` directory exists and is located at the same level as where the script is executed, or adjust the path in the script accordingly.

Here’s a simple way to execute the script from the terminal:

```bash
sh /home/matias/.scripts/fzf_songlauncher.sh
```

Alternatively, you might want to bind it to a key in your window manager. For example, in `qtile`, you could add a key binding like this:

```python
Key([mod], "s", lazy.spawn("/home/matias/.scripts/fzf_songlauncher.sh")),
```

This would allow you to press a key combination (defined by `mod + s` in this case) to launch the song selection interface while using qtile.

---

> [!TIP] 
> The script currently uses a relative path to the `music` directory. To enhance its flexibility, consider passing the music directory as a command-line argument or defining it as an environment variable. Additionally, error handling could be implemented to check if `fzf` or `cmus` are installed and provide user feedback accordingly.
