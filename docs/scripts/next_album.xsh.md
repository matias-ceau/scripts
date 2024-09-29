# Next Album Script for Cmus

---

**next_album.xsh**: Skip to the next album in the Cmus music player.

---

### Dependencies

- `cmus` - A small and fast music player for Unix-like operating systems.
- `xonsh` - A Python-powered shell that brings the best of all shells and programming languages together.

### Description

The `next_album.xsh` script allows users to skip to the next album while using the `cmus` music player. It leverages the `cmus-remote` command to achieve this functionality.

Here’s a step-by-step breakdown of how the script functions:

1. The script begins by executing the command `cmus-remote -C 'view 4'`, which sets the view in `cmus` to the album view.
2. It saves the currently playing playlist to a temporary M3U file located at `/home/matias/.temp/now_playing.m3u`.
3. The script reads the contents of the `now_playing.m3u` file and constructs a list called `now`, filtering out any empty lines.
4. It extracts the album names from the file paths into a list called `albums`.
5. The current album is identified using `cmus-remote -Q`, which queries the current status of `cmus`.
6. The script then iterates through the `albums` list and counts how many albums precede the current one.
7. Finally, it skips to the next album by executing `cmus-remote -n` for as many times as counted.

### Usage

To execute the script, simply run it in your terminal. Make sure you have `cmus` open and music is playing. Here’s how to invoke it:

```bash
/home/matias/.scripts/next_album.xsh
```

You might also consider assigning it to a keybinding in your Window Manager (e.g., `qtile`) to have quicker access. 

For example, you can add a keybinding in your `qtile` configuration file:

```python
Key([mod], "n", lazy.spawn("/home/matias/.scripts/next_album.xsh")),
```

This command will allow you to skip to the next album by pressing `mod + n`.

---

> [!TIP]  
> Consider implementing error handling to manage situations where `cmus` is not running or if the temporary file access fails. This would improve the robustness of your script. Additionally, consider allowing customization of the path for the temporary M3U file to make it more flexible for users with different directory structures.