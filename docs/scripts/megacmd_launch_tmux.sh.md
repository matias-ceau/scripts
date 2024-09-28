# MEGAcmd Tmux Launcher

---

**megacmd_launch_tmux.sh**: Script to run MEGAcmd in a detached Tmux session

---

### Dependencies

- `tmux`: Terminal multiplexer, allowing multiple terminal sessions to be accessed in a single window.
- `mega-cmd`: Command-line tool for the MEGA cloud storage service.

### Description

This script is designed to seamlessly launch the MEGA command-line client within a new, detached Tmux session. On execution, the script creates a new Tmux session named `MEGA` and opens a window titled `megacmd`, then it executes the `mega-cmd` command within this tmux window. This setup allows users to interact with the MEGA service from a Tmux session that can be detached and reattached as needed, thus providing the flexibility to manage MEGA cloud service operations without tying up a terminal window.

### Usage

To use the script, you simply need to execute it from the terminal. Ensure the script is executable and located in your PATH, or reference the full path to the script:

```bash
/home/matias/.scripts/megacmd_launch_tmux.sh
```

If necessary, make the script executable:

```bash
chmod +x /home/matias/.scripts/megacmd_launch_tmux.sh
```

The script can be integrated into a workspace setup with a keybinding in your qtile or launched manually as demonstrated. Here is a simple example of running the script:

```bash
./megacmd_launch_tmux.sh
```

After running the script, you can attach to the Tmux session with:

```bash
tmux attach-session -t MEGA
```

---

> [!NOTE]
> While this script sets up a tmux session for MEGAcmd, it assumes that `mega-cmd` is installed and configured on your system. If you haven't already configured MEGAcmd, you'll need to run `mega-cmd` interactively on first use to set it up. Additionally, error handling could be improved by checking if `tmux` and `mega-cmd` are installed and providing a user-friendly message if they are not present.