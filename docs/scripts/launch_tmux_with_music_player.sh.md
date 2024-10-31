# Launch Tmux with Music Player

---

**launch_tmux_with_music_player.sh**: Script to create a tmux session for running the music player cmus

---

### Dependencies

- `tmux`: Terminal multiplexer for managing multiple terminal windows.
- `cmus`: A small, fast, and powerful console music player.

### Description

This script is designed for users who wish to manage their music through a dedicated background tmux session without directly opening a terminal window. Upon execution, it creates a new tmux session labeled `MUSIC` and launches `cmus`, a console music player, in the first window (named `cmus`) of this session. This setup is particularly useful if you manage tasks using multiple terminal sessions and wish to avoid clutter on your screen, while still utilizing the powerful music management features of `cmus`.

### Usage

To use this script, you simply need to run it from the terminal. 

```bash
/home/matias/.scripts/bin/launch_tmux_with_music_player.sh
```

Alternatively, if you frequently need to run this script, consider binding it to a key or incorporating it into your qtile configuration for quick access. This way, you can launch your music environment with a simple keypress.

Example keybinding in qtile:

```python
Key([mod], "m", lazy.spawn("/home/matias/.scripts/bin/launch_tmux_with_music_player.sh")),
```

This keybinding sets the `Mod+m` (replace `mod` with your mod key, typically `Mod4` for the super/windows key) to run your script, automatically setting up your music environment.

---

> [!NOTE]  
> This script assumes that the user has `tmux` and `cmus` installed and configured correctly. If you require additional features or wish to open more applications within the same session, consider extending the script with extra commands. Also, it currently doesn't check if a session named `MUSIC` already exists, which could lead to potential conflicts. Adding a check and conditional logic to handle such conflicts would make it more robust.