# Tmux Session Manager Script

---

**tmux_manager.py**: A Python script to manage your Tmux session configurations, simplifying the creation, management, and launching of Tmux sessions.

---

### Dependencies

This script requires the following dependencies:

- `python>=3.13`: Ensure you have an updated Python version.
- `colorama`: Provides color formatting for terminal outputs.
- `pyyaml`: Handles the parsing and manipulation of YAML configuration files.
- `tmux`: The terminal multiplexer, essential for this script to function.

Ensure these dependencies are installed before running the script.

### Description

The `tmux_manager.py` script serves as a sophisticated but user-friendly tool for managing Tmux sessions on Arch Linux. It allows you to define session configurations in a YAML file (`~/.scripts/config/tmux_sessions.yaml`) with support for features like:

- **Session Autostart**: Enable specific sessions to launch automatically.
- **Window Management**: Associate named windows with specific commands.
- **Interactive Configuration**: Easily add new sessions and windows via a guided CLI prompt.
- **Session Listing**: View all sessions, their autostart status, and whether they are currently running.

#### Key Features:
- **Error Management**: Clear output for configuration or command errors using `colorama`.
- **Persistence**: A default YAML configuration is generated if missing.
- **Command Handlers**: Handles commands like `tmux kill-session` and `tmux new-session` effectively, with fallback behavior in case of failures.
- **Cross-Compatibility**: Works seamlessly across different terminal environments.

The configuration YAML example (`DEFAULT_CONFIG`) outlines how to structure session and window settings, with fields like `name`, `autostart`, `windows`, and `command`.

### Usage

The script is command-line driven and provides several options:

```bash
# Display help
python tmux_manager.py --help

# Add a new session interactively
python tmux_manager.py --add

# List all configured sessions
python tmux_manager.py --list

# Launch all sessions
python tmux_manager.py --all

# Launch only autostart-enabled sessions
python tmux_manager.py --auto

# Launch a specific session
python tmux_manager.py --session <SESSION_NAME>

# Relaunch a session, even if it is already running
python tmux_manager.py --session <SESSION_NAME> --relaunch
```

**Example**:
```bash
python tmux_manager.py --session MUSIC
```
This launches the `MUSIC` session, which, for instance, runs the `cmus` command in a Tmux window named `cmus`.

---

> [!NOTE]
> - This script does not validate Tmux installation; explicitly ensuring Tmux is installed would be a valuable enhancement.
> - While highly informative, the usage of colors (via `colorama`) might clutter output or make automation error-prone.
> - Consider implementing unit tests to validate crucial behavior like configuration parsing and launching sessions. For testing purposes, mock subprocess calls could improve robustness.