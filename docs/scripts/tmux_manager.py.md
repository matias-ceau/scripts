# Tmux Session Manager

---

**/home/matias/.scripts/bin/tmux_manager.py**: Control and manage tmux sessions via YAML config

---

### Dependencies

- `colorama`: Provides cross-platform support for colored terminal output.
- `pyyaml`: Used to parse and serialize the YAML configuration file.
- `tmux`: The terminal multiplexer that the script controls.
- Python >= 3.12: Required for running the script.
- `uv`: Utilized in the shebang declaration for a streamlined script execution.

### Description

This script serves as a comprehensive manager for tmux sessions on Arch Linux, tailored for qtile users. It reads a YAML configuration file from a predefined environment variable `SCRIPTS` (expected at `$SCRIPTS/config/tmux_sessions.yaml`) to automate the creation, listing, and managing of tmux sessions and their windows. When the configuration file is absent, it auto-generates one with default sessions such as "MEGA" and "MUSIC". 

Functions include:
- **load_config()**: Loads and parses the YAML file, and creates it with defaults if missing.
- **launch_session()**: Launches a tmux session based on configuration. It smartly checks if the session already exists and can force relaunch if required.
- **add_new_session()**: Provides an interactive prompt to add new session configurations by asking for session name, autostart preference, and window details.
- **list_sessions()**: Displays a formatted list of all configured sessions along with their status, using color codes for readability.

The script uses argparse for command-line argument parsing. It supports various modes such as launching all sessions (`-a`), a specific session (`-s`), only autostart sessions (`-u`), listing sessions (`-l`), or interactively adding a new session (`--add`). Additionally, a force relaunch flag (`-r`) ensures that even running sessions can be restarted.

### Usage

To launch a specific session:
    
    tmux_manager.py --session SESSION_NAME

To launch all sessions:

    tmux_manager.py --all

To launch sessions marked for autostart:

    tmux_manager.py --auto

To list all sessions:

    tmux_manager.py --list

To add a new session interactively:

    tmux_manager.py --add

For force relaunching a session:

    tmux_manager.py --session SESSION_NAME --relaunch

---

> [!TIP] Considerations for Improvement:
> - Further modularize the code by splitting configuration management, session control, and CLI parsing into separate modules.
> - Implement robust error handling and logging rather than relying solely on console prints.
> - Validate user inputs during interactive session addition to prevent configuration errors.
> - Ensure compatibility with environments where the `tmux` command might not be present or the environment variable `SCRIPTS` is incorrectly set.
> - Review the shebang usage (`uv run`) to ensure consistency across different deployment setups.