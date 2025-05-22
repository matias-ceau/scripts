# Tmux Session Manager

---

**tmux_manager.py**: Python utility to manage named tmux sessions using a YAML configuration file

---

### Dependencies

- `tmux` (Terminal multiplexer; must be installed and in your `PATH`)
- `python >=3.13`
- `colorama`: For colored terminal output
- `pyyaml`: For loading and saving YAML configs
- `uv` (optional, but script shebang expects `uv run --script`; see [uv](https://github.com/astral-sh/uv))
- Standard Python libraries: `argparse`, `os`, `signal`, `subprocess`, `sys`, `pathlib`

### Description

This script manages your tmux sessions based on a central YAML config (`$SCRIPTS/config/tmux_sessions.yaml`). Sessions are defined in this file along with their windows and startup commands. The script supports:

- Listing all configured sessions and their statuses
- Launching specific or all sessions, optionally force-restarting them
- Autostarting only those flagged as `autostart: true` in config
- Interactive prompt to add new sessions via the CLI
- Output uses color coding for better readability (requires a truecolor terminal)

Session definitions are like:

```yaml
sessions:
  - name: MUSIC
    autostart: true
    windows:
      - name: player
        command: cmus
      - name: edit
        command: nvim ~/Music/playlist.m3u
```

Features:
- Automatically initializes config if missing, including a sensible default
- Handles proper process detachment and session killing/relaunching
- Safety prompts for overwriting existing session configs
- Graceful exit on Ctrl+C, with visually distinct warnings/errors

### Usage

You may run tmux_manager.py in a terminal, or bind it to a key in your qtile setup (recommended for quick autostart, etc).

**Common invocations:**

```sh
./tmux_manager.py --list
# or (if using uv as in the shebang)
uv run -- tmux_manager.py --list

./tmux_manager.py --session MUSIC         # Launch "MUSIC"
./tmux_manager.py --session music --relaunch   # Relaunch (kill & restart) "MUSIC"
./tmux_manager.py --all                   # Launch all configured sessions
./tmux_manager.py --auto                  # Launch only autostart sessions
./tmux_manager.py --add                   # Add a new session interactively
```

For integrating autostart on login:
Add to your qtile or user startup scripts:
```sh
tmux_manager.py --auto
```

**Interactive Session Creation:**
```
$ ./tmux_manager.py --add

=== Adding New Tmux Session Configuration ===
Enter session name: dev
Enable autostart? (y/N): y

Enter window name (or empty to finish): python
Enter command for this window: nvim main.py

Enter window name (or empty to finish):
Session 'DEV' added successfully!
```

---

> [!TIP]
>
> - The script will always create `$SCRIPTS/config/tmux_sessions.yaml` if not present, but `$SCRIPTS` must be set (or it'll default to `~/scripts`). Make sure you have consistent environment handling.
>
> - The script relies on `tmux` CLI; any custom tmux configuration might affect behavior.
>
> - No built-in "delete session from config" option. Removing sessions must be done by editing the YAML directly, or implement an extra flag.
>
> - Consider validating window commands before execution to surface errors proactively.
>
> - Windows and commands are not deeply validated; misconfigured YAML (wrong keys, etc.) is only warned, not fatal.
>
> - If run from within tmux, window management may behave unexpectedly (detached sessions).