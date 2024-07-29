# launch_tmux_with_music_player.sh

**Script Description**

This is a Bash shell script that creates a new tmux session named "music" and opens the cmus audio player within it, without launching an actual terminal window.

**Functionality Breakdown**

Here's what the script does:

1. `tmux new-session`: Creates a new tmux session.
	* `-d` option means "detached", which means the session will be created in the background, without attaching to any existing shell.
2. `-s music`: Sets the name of the new session to "music".
3. `-n cmus`: Sets the name of the window (pane) within the session to "cmus". This is where the cmus audio player will be opened.
4. `'cmus'`: Runs the `cmus` command within the newly created tmux window.

**Key Benefits**

This script:

* Creates a dedicated tmux session for music-related tasks, keeping your main shell sessions organized and separate.
* Opens the cmus audio player within this dedicated session, allowing you to play music without cluttering your main shell or terminal.

**Context**

To use this script, save it to a file (e.g., `create_music_tmux_session.sh`), make it executable with `chmod +x create_music_tmux_session.sh`, and then run it with `./create_music_tmux_session.sh`. The tmux session will be created in the background, without launching an actual terminal window. You can then access this session using `tmux attach -t music` or by running other tmux commands to interact with the "music" session.