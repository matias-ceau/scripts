# Tmux Session Creator

---

**tmux_session.sh**: Script to create a new tmux session with a specified session name, window name, and command.

---

### Dependencies

- `tmux`: Terminal multiplexer for managing multiple terminal sessions. Ensure tmux is installed on your Arch Linux system.

### Description

This script initializes a new tmux session, assigning a designated session name, window name, and executing a specified command within that window. The script requires all three options to be specified: session name, window name, and command. The script is particularly useful when you want to automate the management of multiple terminal sessions, enhancing efficiency and organization in your workflow when using terminal emulators within the qtile window manager.

The script does this by:

- Parsing command-line arguments using the `getopts` builtin.
- Validating that all required options are provided and displaying usage information if not.
- Executing the `tmux` command with provided arguments to establish a new session in detached mode.
- Confirming the creation of the session by echoing the details.

### Usage

To use the script, execute it from the terminal with the following mandatory options:

- `-s <session-name>`: The name of the tmux session.
- `-w <window-name>`: The name of the tmux window.
- `-c <command>`: The command to execute in the tmux session.

Example usage:

```bash
~/.scripts/bin/tmux_session.sh -s mySession -w myWindow -c "htop"
```

The command above creates a tmux session named `mySession` with a window `myWindow` running `htop`.

This script can be run interactively from the terminal or could be adapted to bind to a keyboard shortcut within qtile if frequent session creation is desirable.

---

> [!TIP]
> One potential improvement involves adding error handling to check the success of the tmux command for session creation. Additionally, consider adding an option for attaching to the session automatically after creation or checking if a session with the same name already exists to avoid conflicts.