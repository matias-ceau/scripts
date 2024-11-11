# Tmux Session Manager

---

**tmux_manager.py**: Manage and automate tmux sessions using a configuration file

---

### Dependencies

- `colorama`: For colored terminal text output.
- `pyyaml`: For parsing and writing YAML configuration files.

### Description

`tmux_manager.py` is a script designed to streamline the management of tmux sessions with defined configurations on your Arch Linux setup with qtile. This script utilizes a YAML configuration file (`tmux_sessions.yaml`) to define sessions, auto-start settings, and associated windows and commands. If the configuration file doesn't exist, a default one is created.

The main components are:
- `TmuxSession`: A class that encapsulates a tmux session's state, including checking if it's running.
- **Configuration Management**: Load and edit session configurations interactively.
- **Session Operations**: Launch sessions, including specific or all configured ones and auto-start those marked for it.

### Usage

You can execute the script with various options to manage tmux sessions:

```shell
# List all configured sessions
./tmux_manager.py -l

# Add a new session interactively
./tmux_manager.py --add

# Launch a specific session
./tmux_manager.py -s SESSION_NAME

# Launch all sessions
./tmux_manager.py -a

# Launch all sessions marked as autostart
./tmux_manager.py -u

# Force relaunch a session if already running
./tmux_manager.py -s SESSION_NAME -r
```

You can bind this script to a qtile keybinding or execute it manually from the terminal as needed.

---

> [!NOTE]
> The script handles both the absence of the configuration file by creating a default one, and running sessions with the `force_relaunch` parameter. However, it would be optimal to add logging functionality for detailed session operations and error tracking. Also, consider encapsulating more functionality within the `TmuxSession` class for better object-oriented design practices.