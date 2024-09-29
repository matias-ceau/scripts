# Launch TMUX with Music Player

---

**launch_tmux_with_music_player.sh**: Script to create a new tmux session named music and launch cmus.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows multiple terminal sessions to be accessed and controlled from a single screen.
- `cmus`: A highly customizable music player that runs in the terminal.

### Description

This script is designed for users who want to quickly create a new tmux session specifically for music playback using cmus. By utilizing tmux, the script allows the user to run cmus in a separate session, enabling multitasking in a terminal environment without the need for multiple terminal windows. 

The script executes a simple command:

```bash
tmux new-session -d -s MUSIC -n cmus 'cmus'
```

- `tmux new-session`: This creates a new tmux session.
- `-d`: This flag starts the session in detached mode, meaning it runs in the background.
- `-s MUSIC`: This specifies the name of the session, which is set to "MUSIC".
- `-n cmus`: This sets the name of the window in the new session to "cmus".
- `'cmus'`: This is the command that runs within the tmux session.

### Usage

To use this script, simply execute it from the terminal. You can run it with the following command:

```bash
bash /home/matias/.scripts/launch_tmux_with_music_player.sh
```

Once the script is executed, a new tmux session named "MUSIC" will be created and cmus will start running. You can then attach to this session later if you want to control cmus:

```bash
tmux attach-session -t MUSIC
```

You can also set up a keybinding in your window manager (qtile) to launch this script, allowing for quick access whenever you want to listen to music.

---

> [!TIP]  
> This script is straightforward but could benefit from additional features, such as checking if tmux or cmus is already running, and providing feedback messages to the user. Error handling could also be implemented to manage scenarios where the required software is not installed.