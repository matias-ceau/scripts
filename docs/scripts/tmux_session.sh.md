# Tmux Session Launcher

---

**tmux_session.sh**: Create a detached tmux session/window and run a command inside

---

### Dependencies

- `bash` (script runtime; uses `getopts`)
- `tmux` (creates the session/window and runs the provided command)

### Description

This script is a small helper to spawn a new **detached** tmux session with a single named window, executing a command immediately in that window. It’s useful on Arch Linux/qtile setups when you want to start background terminal workflows (dev servers, music tools, log tails, etc.) from a keybinding, autostart hook, or another script—without attaching to tmux.

How it works:

- Requires three flags:
  - `-s` session name
  - `-w` window name
  - `-c` command to run (typically quoted)
- Validates that all options are provided, otherwise prints a usage message and exits.
- Calls:
  - `tmux new-session -d -s "$session" -n "$window" "$command"`
- Prints a short summary for verification (helpful when called from a terminal or logged).

### Usage

Run from a terminal or from qtile/autostart scripts:

```sh
tmux_session.sh -s work -w editor -c "nvim ~/notes/todo.md"
```

Start a long-running process:

```sh
tmux_session.sh -s dev -w api -c "cd ~/src/api && make run"
```

Tail logs in the background:

```sh
tmux_session.sh -s sys -w logs -c "journalctl -f"
```

Later, attach manually:

```sh
tmux attach -t work
```

---

> [!TIP]
> Consider handling the case where the session already exists (currently `tmux new-session` will fail). A common improvement is: if session exists, create a new window or just send the command to an existing window. Also, the shebang is `#!/usr/bin/bash` (fine on Arch), but `#!/usr/bin/env bash` can be more portable. Finally, if the command includes complex quoting, you may want to accept `-c` as “the rest of arguments” instead of a single string to avoid shell-escaping pitfalls.