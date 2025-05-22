# Launch Tmux with Music Player

---

**launch_tmux_with_music_player.sh**: Creates a headless `tmux` session named "MUSIC" and starts the `cmus` music player within.

---

### Dependencies

- `tmux`: Terminal multiplexer for managing multiple terminal sessions.
- `cmus`: Lightweight CLI music player.
- `/usr/bin/bash`: The script runs in Bash; Arch Linux uses `/usr/bin/bash` by default.

### Description

This script is designed to quickly set up a detached `tmux` session running the `cmus` music player, ideal for background music listening without launching a visible terminal window. Specifically, it:

- Creates a new `tmux` session named `MUSIC`.
- Opens a window inside the session, named `cmus`.
- Launches `cmus` within that window.
- Does *not* attach to the session, so it runs quietly in the background.

This makes it easy to integrate with qtile keybindings or scripts; for example, you can bind this script to a hotkey to instantly start your music backend.

### Usage

To use the script, simply execute:

```
~/.scripts/bin/launch_tmux_with_music_player.sh
```

#### Example: Attach to the session

To view or control `cmus`, simply attach to the tmux session:

```
tmux attach-session -t MUSIC
```
Or, if you want to close the player and kill the session:
```
tmux kill-session -t MUSIC
```

#### Typical workflow with qtile

- Bind this script to a keybinding in your qtile `config.py`.
- Control playback via `cmus-remote` commands, tmux, or by re-attaching as shown above.

---

> [!TIP]
> - The script does not check if a session called `MUSIC` already exists. Running it multiple times will result in a tmux error ("duplicate session: MUSIC"). You could improve the script by checking for an existing session and, optionally, switching to (or restarting) it.
> - Also, there is no error handling; failures of `cmus` (if it is not installed, for example) won't show up unless you manually check.
> - Consider accepting the session name or music player as an optional argument to make the script more flexible for future use.