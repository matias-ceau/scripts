# launch_tmux_with_music_player.sh

# Music Tmux Session Script

This bash script creates a new `tmux` session named `music` and starts the `cmus` music player within that session. The session is created in detached mode, meaning it runs in the background without attaching to a terminal.

## Usage

To use this script, simply run it from your terminal. Make sure you have both `tmux` and `cmus` installed on your system.

```bash
./your_script_name.sh
```

### Prerequisites

- **tmux**: Terminal multiplexer to create and manage terminal sessions.
- **cmus**: A console music player.

### How It Works

1. **Create a new `tmux` session:** 
   The script uses the `tmux` command to create a new session named `music`.
2. **Run `cmus` in the new session:**
   Within the `music` session, a new window named `cmus` is created, and `cmus` is run inside it.

### Detailed Breakdown

- `tmux new-session`: Creates a new `tmux` session.
- `-d`: Detaches the session immediately after creation. It will run in the background.
- `-s music`: Names the new session as `music`.
- `-n cmus`: Creates a new window named `cmus` within the session.
- `'cmus'`: The command to be executed within the new session and window, which in this case is the `cmus` music player.

### Example

Running the script would start `cmus` in a background `tmux` session named `music`. You can attach to it later using:

```bash
tmux attach-session -t music
```

### Developed and Maintained by

This script was documented on 2024-07 with the aim of providing a command-line interface (CLI) solution for music players using `tmux` and `cmus`.

---

Feel free to modify the script to fit your specific needs and share feedback. Happy listening!