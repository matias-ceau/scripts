# tmux_manager — YAML-driven tmux session launcher

---

**tmux_manager.py**: Manage and launch tmux sessions/windows from a YAML config

---

### Dependencies

- `python>=3.13` (script header targets 3.13)
- `uv` (runs via shebang: `uv run --script`)
- `tmux` (session/window creation and probing)
- `pyyaml` (reads/writes the sessions config)
- `colorama` (colored status/output)
- `build`, `setuptools` (declared in header; not used at runtime but required by the script metadata block)

---

### Description

This script provides a small “tmux profiles” manager backed by a YAML file at `$SCRIPTS/config/tmux_sessions.yaml` (defaults to `~/scripts/config/tmux_sessions.yaml` if `$SCRIPTS` is unset). On first run, it creates the directory and writes a default config containing example sessions (e.g. `MEGA`, `MUSIC`).

Core behaviors:

- Parses `sessions:` entries into `TmuxSession` objects (session names are normalized to uppercase).
- Checks session status via `tmux has-session -t NAME`.
- Launches sessions detached (`tmux new-session -d`) and then adds additional windows via `tmux new-window`.
- Supports “force restart” with `--relaunch` (kills existing sessions before recreating).
- Provides an interactive `--add` flow to append/overwrite a session definition and writes back YAML.

Signal handling for `SIGINT`/`SIGTERM` exits cleanly, which is handy when binding this in qtile and you cancel mid-run.

---

### Usage

List configured sessions and running state:

    tmux_manager.py --list

Launch all sessions:

    tmux_manager.py --all

Launch only `autostart: true` sessions (good for login/qtile autostart):

    tmux_manager.py --auto

Launch one session (case-insensitive):

    tmux_manager.py --session music

Force relaunch (kill + recreate):

    tmux_manager.py --session music --relaunch

Add a new session interactively:

    tmux_manager.py --add

---

> [!TIP]
> Improvements to consider:
> - `build`/`setuptools` aren’t used at runtime; removing them from the script metadata avoids unnecessary installs.
> - `tmux new-session ... [window_cmd]` passes the command as a single argument; complex commands with spaces/shell operators won’t work as expected—consider `tmux ... sh -lc '...'` or YAML `command: ["prog","arg"]` support.
> - Window names are uppercased on add, but not on load; standardize casing for consistency.
> - `--all/--auto` currently treats “already running” as a failure unless `--relaunch`; you might prefer “skip if running” semantics.