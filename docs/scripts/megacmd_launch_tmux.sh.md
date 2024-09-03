# MegaCMD TMUX Session Launcher

---

**megacmd_launch_tmux.sh**: Launches a new TMUX session for MegaCMD.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows multiple sessions and windows within a single terminal.
- `mega-cmd`: The command-line interface for Mega.nz cloud storage, providing access to various functionalities.

### Description

This script is designed to facilitate the management of a MegaCMD session within a TMUX environment. It allows you to launch a new TMUX session named `MEGA` with a single window named `megacmd` that runs the MegaCMD client. The use of TMUX enhances productivity by allowing users to detach and reattach to sessions as needed, making it ideal for long-running commands or monitoring tasks.

The script executes the following command:

```bash
tmux new-session -d -s MEGA -n megacmd 'mega-cmd'
```

- `tmux new-session`: This creates a new TMUX session.
- `-d`: Start the session in detached mode.
- `-s MEGA`: Sets the session name to `MEGA`.
- `-n megacmd`: Names the window within the session `megacmd`.
- `'mega-cmd'`: This is the command that will run in the newly created window.

### Usage

To use this script, ensure you have both TMUX and MegaCMD installed on your Arch Linux system. You can run the script directly from a terminal:

```bash
bash /home/matias/.scripts/megacmd_launch_tmux.sh
```

Alternatively, you could create a keybinding in your window manager (qtile) to execute this script. Here’s how you can create a keybinding to launch the script:

```python
Key([mod], "m", lazy.spawn("bash /home/matias/.scripts/megacmd_launch_tmux.sh")),
```

This example uses the Mod key and assigns it to the action of launching the script, making it easily accessible.

---

> [!TIP] 
> The script currently does not check if a TMUX session named `MEGA` already exists. If you run the script multiple times, it may result in errors or unnecessary sessions. Consider adding a check to see if the session is already running and either reattach to it or create a new one accordingly.