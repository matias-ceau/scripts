# Launch Tmux with Music Player

---

**launch_tmux_with_music_player.sh**: Script to create a new tmux session called music and open cmus inside

---

### Dependencies

- `tmux`: A terminal multiplexer allowing the user to access multiple terminal sessions inside a single window.
- `cmus`: A small, fast and powerful console music player for Unix-like operating systems.

### Description

This script is designed to automate the creation of a `tmux` session specifically for running the `cmus` music player. When executed, it initiates a detached tmux session named "MUSIC". Within this session, it opens `cmus` in a new window labeled "cmus", allowing for listening to music without the need to have the terminal directly opened.

While the script does not bring up a terminal window by itself, it will manage the tmux session in the background, which you can later attach to via the terminal.

### Usage

To use the script:

1. Ensure it's executable. You might need to run:
   ```bash
   chmod +x /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

2. Execute the script from the terminal:
   ```bash
   /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

This command creates the session and runs `cmus` within it. You can attach to this tmux session later to interact with `cmus`:

```bash
tmux attach-session -t MUSIC
```

For seamless integration, consider assigning this script a keybinding via your qtile WM for one-click access.

---

> [!INFO]
> Consider improving the script by adding checks to see if the session "MUSIC" already exists before creating a new one, to prevent conflicts or unwanted session duplication.
> 
> > For example, add a validation like:
> ```bash
> if ! tmux has-session -t MUSIC 2>/dev/null; then
>   tmux new-session -d -s MUSIC -n cmus 'cmus'
> fi
> ```