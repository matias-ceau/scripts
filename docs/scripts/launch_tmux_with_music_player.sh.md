# Launch Music in Tmux

---

**launch_tmux_with_music_player.sh**: Script to create a new tmux session called music and open cmus.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows multiple terminal sessions to be accessed and controlled from a single window.
- `cmus`: A small, fast audio player for Unix-like operating systems.

### Description

This script automates the process of launching a new `tmux` session specifically for music playback using `cmus`, a lightweight audio player. Upon execution, it creates a detached `tmux` session named `MUSIC`, and within that session, it starts the `cmus` player. This allows you to easily manage and play music while keeping your workspace organized, as the `cmus` player runs within its own session. 

The script is straightforward, consisting of a single command that leverages `tmux` functionality:

```bash
tmux new-session -d -s MUSIC -n cmus 'cmus'
```

- `new-session`: This flag indicates that a new session should be created.
- `-d`: This option tells `tmux` to start the session in detached mode, meaning it won't take over your terminal interface.
- `-s MUSIC`: This specifies the name of the session as `MUSIC`.
- `-n cmus`: Sets the name of the window within the session to `cmus`.
- `'cmus'`: This command initiates the `cmus` music player.

### Usage

To use the script, simply execute it in your terminal environment as follows:

```bash
bash /home/matias/.scripts/launch_tmux_with_music_player.sh
```

After running the script, you can attach to the tmux session using the following command:

```bash
tmux attach -t MUSIC
```

This will bring you into the music session, where you can control `cmus` using keyboard shortcuts.

---

> [!TIP] 
> This script could be enhanced by adding command-line arguments that enable users to specify alternative session names or player options. For example, allowing users to start other players (like `mpd` or `mplayer`) within the same tmux session could increase the utility of the script. Additionally, error handling should be introduced to manage cases where `tmux` or `cmus` might not be installed or accessible.