# Launch Tmux with Music Player

---

**launch_tmux_with_music_player.sh**: Script to create a new tmux session called "music" and open cmus.

---

### Dependencies

- `tmux`: A popular terminal multiplexer that allows multiple terminal sessions to be accessed in a single window.
- `cmus`: A small, fast and powerful console music player for Unix-like operating systems.

### Description

This script simplifies the process of setting up a dedicated tmux session that runs `cmus`—your console-based music player—without the need to manually open a terminal window. The script uses the `tmux` command to create a new detached session named "MUSIC". Within this session, it opens a new window (or tab) with the `cmus` player already launched, ready for you to connect and interact with whenever you choose.

Using `tmux` to handle your music player can be advantageous in terms of resource management and maintaining a clutter-free desktop environment in your Arch Linux setup with `qtile` as your window manager.

### Usage

To employ this script, simply execute it from your terminal:

```bash
bash /home/matias/.scripts/bin/launch_tmux_with_music_player.sh
```

Once executed, it starts a tmux session named "MUSIC" with `cmus`. This session is detached, which means it runs in the background and the terminal will return control to you immediately.

To attach to the running tmux session and interact with `cmus`, use:

```bash
tmux attach-session -t MUSIC
```

You can assign this script to a keybinding in your `qtile` configuration file for quick access.

---

> [!TIP]
> The script is straightforward and efficient for what it is intended to achieve. However, error handling could be improved. For instance, checking if a session named "MUSIC" already exists would prevent errors and duplicates. Additionally, consider adding comments or documentation within the script itself for maintenance purposes and improve readability.