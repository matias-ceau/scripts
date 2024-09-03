# fzf Song Launcher

---

**fzf_songlauncher.sh**: Play a song with cmus, choosing it with fzf

---

### Dependencies

- `cmus`: A lightweight music player for Linux, allowing for efficient music playback.
- `fzf`: A command-line fuzzy finder that allows you to search and select files interactively.

### Description

The `fzf_songlauncher.sh` script provides a simple and effective way to play music from the command line using `cmus`. It utilizes `fzf` to present a fuzzy search interface, allowing users to quickly locate and select a song from their music directory. The script is designed to work seamlessly with the `cmus` music player, making it easy to integrate into your workflow in an Arch Linux environment, specifically when using the `qtile` window manager.

The script operates by:

1. Utilizing the `find` command to recursively search your `music` directory for audio files.
2. Passing the list of found files to `fzf`, enabling users to filter through them interactively.
3. Once a file is selected, it is played in `cmus` using the `cmus-remote` command.

### Usage

To use the `fzf_songlauncher.sh` script, make sure it's executable and then run it from your terminal:

```bash
chmod +x /home/matias/.scripts/fzf_songlauncher.sh
/home/matias/.scripts/fzf_songlauncher.sh
```

You will be presented with a list of music files to choose from. Simply start typing the name of the song you want to play, and `fzf` will filter the results. Press `Enter` once you've found the song you want, and `cmus` will start playing it. 

You may also consider binding this script to a keyboard shortcut in your `qtile` configuration for quicker access.

---

> [!TIP]  
> This script currently searches for all files in the `music` directory without filtering based on file type. This could lead to non-audio files appearing in the list, which might cause confusion. Consider modifying the `find` command to only look for common audio file extensions (like `.mp3`, `.wav`, `.flac`, etc.) to enhance user experience.