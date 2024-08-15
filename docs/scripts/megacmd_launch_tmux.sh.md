# Launch MEGA CMD in Tmux

---

**megacmd_launch_tmux.sh**: Launches the MEGA command line interface in a new tmux session.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows creating and managing multiple terminal sessions in one window.
- `mega-cmd`: A command line interface for managing MEGA cloud storage.

### Description

This script is designed to create a new `tmux` session named "MEGA" and run the `mega-cmd` tool within it. `tmux` enables users to manage their command-line applications more efficiently by allowing multiple sessions to run simultaneously, with the ability to detach and reattach as needed. 

The script uses the following bash command:

```bash
tmux new-session -d -s MEGA -n megacmd 'mega-cmd'
```

- `new-session`: This `tmux` command creates a new session.
- `-d`: This option runs the session in detached mode, meaning it won't attach to the terminal immediately.
- `-s MEGA`: Specifies the name of the new session as "MEGA".
- `-n megacmd`: Assigns the name "megacmd" to the window within the new session.
- `'mega-cmd'`: This command is executed within the new tmux window.

### Usage

To run this script, ensure it has executable permissions and simply execute it from the terminal:

```bash
chmod +x /home/matias/.scripts/megacmd_launch_tmux.sh
/home/matias/.scripts/megacmd_launch_tmux.sh
```

You can also bind this script to a key combination in your window manager (like `qtile`) or your desktop environment for quick access.

Once execute, you can reattach to the `tmux` session at any time using:

```bash
tmux attach-session -t MEGA
```

If you want to exit but keep the session running, you can detach from the `tmux` session with: 

```bash
Ctrl+b d
```

---

> [!TIP] 
> While the script effectively launches `mega-cmd` in a new tmux session, consider adding error handling to check if `tmux` and `mega-cmd` are installed before executing. This will increase robustness and improve user experience. Additionally, providing feedback after launching could be helpful (e.g., informing the user on how to reattach to the session).