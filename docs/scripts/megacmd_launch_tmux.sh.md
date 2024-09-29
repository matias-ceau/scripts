# Launch MegaCMD in Tmux Session

---

**megacmd_launch_tmux.sh**: Launches a new Tmux session for MegaCMD command line interface.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows for multiple terminal sessions to be accessed simultaneously.

- `mega-cmd`: The command-line interface for MEGA, a cloud storage service. This utility enables users to manage files in their MEGA account directly from the terminal.

### Description

This script is designed to facilitate the use of the MegaCMD application within a Tmux session. Tmux is particularly useful for managing multiple terminal sessions from a single window, allowing users to detach and reattach to these sessions as needed.

The script accomplishes this by executing a new Tmux session with the following parameters:

- **-d**: Starts the session in detached mode, so the user doesn’t need to be present when the session starts.

- **-s MEGA**: Names the session "MEGA", allowing for easy identification and management of the session later.

- **-n megacmd**: Creates a new window named "megacmd" within the session for running the MegaCMD interface.

In summary, once executed, this script will allow users to seamlessly access and utilize MegaCMD in a dedicated Tmux environment.

### Usage

To use this script, simply execute it in the terminal by running:

```bash
bash /home/matias/.scripts/megacmd_launch_tmux.sh
```

This command will create a new Tmux session called "MEGA" and launch the MegaCMD interface. 

### Keybinding

For users of Qtile, you can assign this script to a keybinding in your configuration, allowing for quicker access. For example:

```python
Key([mod], "m", lazy.spawn("/home/matias/.scripts/megacmd_launch_tmux.sh")),
```

This example binds the script to the "mod + m" combination.

---

> [!TIP]  
> The script currently does not handle errors, such as if Tmux is not installed or if the MegaCMD command fails to execute. Consider adding error handling to improve robustness. Additionally, providing user feedback upon execution can enhance usability.