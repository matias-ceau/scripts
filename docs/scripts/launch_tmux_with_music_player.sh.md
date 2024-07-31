# Launch Tmux with Music Player

---

**[launch_tmux_with_music_player.sh](launch_tmux_with_music_player.sh)**: Script to create a tmux session for running cmus

---

### Dependencies

- `tmux`: A terminal multiplexer that allows multiple terminal sessions to be accessed and controlled from a single screen.
- `cmus`: A lightweight and powerful console music player.

### Description

This shell script is designed for users who want to quickly launch a new `tmux` session specifically for playing music with `cmus`. By executing this script, a detached `tmux` session named `MUSIC` will be created, and `cmus` will start automatically within that session.

**Key Features:**
- **Detached Session**: The script uses the `-d` flag with `tmux new-session`, which allows the session to run in the background without attaching to it automatically.
- **Named Session**: The `MUSIC` name makes it easy to identify the session, especially for users who may have multiple sessions running.

### Usage

To use the script, ensure it is executable and run it from your terminal. If you want it to run from any location, consider placing it in a directory that is included in your `PATH`.

1. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

2. Run the script:
   ```bash
   /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

3. To attach to the `tmux` session after executing the script, use:
   ```bash
   tmux attach -t MUSIC
   ```

You can also assign this script to a keybinding in your window manager or desktop environment for quick access while using `qtile` or other window managers.

---

> [!TIP]  
> Consider enhancing the script by allowing command-line arguments that let the user specify the session name or the music player to be opened. For example, a more flexible script could accept additional parameters for customized experience.
