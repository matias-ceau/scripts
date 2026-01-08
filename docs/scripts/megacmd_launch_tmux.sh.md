# MEGAcmd tmux launcher

---

**megacmd_launch_tmux.sh**: Start `mega-cmd` in a dedicated detached tmux session

---

### Dependencies

- `tmux` — terminal multiplexer used to host the long-running session  
- `mega-cmd` — MEGA command-line daemon/shell you want to keep available

### Description

This script creates (or attempts to create) a dedicated `tmux` session named `MEGA` and starts `mega-cmd` inside it. The session is created **detached** (`-d`), so it won’t take over your current terminal—handy for launching from qtile keybindings, autostart hooks, or other scripts.

Command breakdown:

- `tmux new-session`: creates a new session
- `-d`: start detached (don’t attach immediately)
- `-s MEGA`: session name is `MEGA`
- `-n megacmd`: initial window name is `megacmd`
- `'mega-cmd'`: command executed in that window

This provides a persistent place where MEGA’s CLI can run without being tied to a terminal tab you might close.

### Usage

Run manually:

    ~/.scripts/bin/megacmd_launch_tmux.sh

Attach to the session:

    tmux attach -t MEGA

Detach (inside tmux):

    Ctrl-b d

Kill the session when you don’t need it anymore:

    tmux kill-session -t MEGA

qtile keybinding example (conceptually):

- bind a key to execute:

      ~/.scripts/bin/megacmd_launch_tmux.sh

---

> [!TIP]
> `tmux new-session` will fail if a session named `MEGA` already exists. Consider using `tmux has-session -t MEGA 2>/dev/null || tmux new-session ...` to make it idempotent, or `tmux new-session -A -s MEGA ...` (attach-or-create behavior). You may also want to ensure `mega-cmd` is on `$PATH` in non-interactive launches (qtile/autostart), or use an absolute path for reliability.