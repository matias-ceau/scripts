# megacmd_launch_tmux.sh

---

**megacmd_launch_tmux.sh**: Launches `mega-cmd` inside a new detached tmux session.

---

### Dependencies

- `tmux`: Terminal multiplexer to manage sessions.
- `mega-cmd`: MEGA CLI client for interacting with MEGA cloud services.

### Description

This script is a utility for starting the `mega-cmd` application in a detached tmux session. It creates a new tmux session called `MEGA` with a single window named `megacmd`, running the `mega-cmd` process in it. This is helpful to ensure that `mega-cmd` runs in the background and remains alive, independent from any terminal window.

Key features:

- Starts tmux detached (`-d`).
- Sets session name (`-s MEGA`).
- Sets initial window name (`-n megacmd`) for clarity.
- Ensures that `mega-cmd` keeps running until explicitly killed or the tmux session is ended.

### Usage

You can run this script directly from the terminal, or call it from another script, your qtile config, or a keybinding.

**Basic usage:**
```
~/.scripts/bin/megacmd_launch_tmux.sh
```

**Check if the session is running:**
```
tmux ls
```

**Attach to the MEGA session:**
```
tmux attach -t MEGA
```

**Kill the session when you're done:**
```
tmux kill-session -t MEGA
```

**Automate from qtile:**
You can set up a qtile keybinding to execute this script, making `mega-cmd` management seamless from your window manager.

---

> [!TIP]
> - The script does not check if the `MEGA` session already exists, so running it multiple times will fail with a duplicate session error.
> - For idempotency, consider adding:
>   ```
>   tmux has-session -t MEGA 2>/dev/null || tmux new-session -d -s MEGA -n megacmd 'mega-cmd'
>   ```
> - No logging or notification is implemented; if `mega-cmd` fails, you won't see errors.
> - If you want auto-start at login, consider adding the script to your `.xprofile` or an autostart mechanism in qtile.