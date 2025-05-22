# tmux Session Launcher

---

**tmux_session.sh**: Minimal script to launch a detached tmux session with a specified window and command

---

### Dependencies

- `tmux`: Terminal multiplexer. Required to create, attach, and manage terminal sessions.
- `/usr/bin/bash`: The script is written for bash and uses basic shell features.
- `getopts`: Shell builtin used for parsing options.

### Description

This script provides a simplified interface for launching new `tmux` sessions on your Arch Linux environment, especially useful if you often automate terminal multiplexer setups (e.g., for development or testing environments from qtile keybindings). It ensures you specify:

- a tmux session name (`-s`),
- a window name within that session (`-w`),
- and a command to run inside the new window (`-c`).

**Key features:**
- Enforces all options as mandatory, avoiding ambiguous or partial session creation.
- Useful as both an interactive tool or within scripts and window manager hooks.
- Output echoes all parameters for quick verification.

#### How it works:
- Parses options with `getopts`. Exits with usage info if any required option is missing.
- Launches a new detached (`-d`) tmux session with the assigned session/window name and command.
- Prints the resulting configuration for transparency.

---

### Usage

To run the script directly from a terminal:

```
~/.scripts/bin/tmux_session.sh -s dev_session -w editor -c "nvim"
```

**Example use cases:**
- Starting a new Python REPL in a tmux session called `py`:
  ```
  ~/.scripts/bin/tmux_session.sh -s py -w repl -c "python"
  ```
- Running a long process in its own session:
  ```
  ~/.scripts/bin/tmux_session.sh -s downloads -w aria -c "aria2c http://example.com/file"
  ```

**Integration with qtile:**

You can bind this script to a key or group launch:
```python
# Example (add to qtile config):
Key([mod], "F10", lazy.spawn("~/.scripts/bin/tmux_session.sh -s scratchpad -w sysmon -c 'htop'"))
```

---

> [!TIP]
> - This script doesn't check for existing sessions/windows with the same names, which may result in errors or duplicate sessions if you run the script with the same parameters multiple times. It would be beneficial to add a check to prevent accidental overwrite or to attach to existing sessions.
> - The command runs only in the first window; additional window management must be done manually.
> - Optionally, support for attaching to the session after creation, or making options optional (with sensible defaults), could improve usability.
> - Lastly, a `-h|--help` option for cleaner CLI usage would be handy.