# MegaCMD Tmux Launcher

---

**megacmd_launch_tmux.sh**: Launches MEGA CMD within a detached tmux session.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows managing multiple terminal sessions simultaneously.
- `mega-cmd`: A command-line tool for MEGA.nz, a cloud storage and file hosting service.

### Description

This script is designed to automate the process of launching `mega-cmd` in a detached tmux session named "MEGA" with a window titled "megacmd". Utilizing tmux allows you to run `mega-cmd` in the background without occupying your terminal, enabling you to manage MEGA.nz tasks seamlessly without disruption to your workflow in Arch Linux with the qtile window manager.

The script uses the `tmux new-session` command to start a new background session. Here, `-d` specifies that the session should start detached from the terminal, allowing it to run independently. The options `-s MEGA` and `-n megacmd` define the session and window names, respectively, facilitating easy identification and management of the session.

### Usage

To run this script, execute it directly from the terminal. Ensure that both `tmux` and `mega-cmd` are installed on your system. You can launch the script by executing the following command:

```sh
bash /home/matias/.scripts/bin/megacmd_launch_tmux.sh
```

Alternatively, integrate the script into your qtile keybindings for quick access. You can also set the script to run automatically at startup by adding it to your `.xprofile` or other startup scripts you use with qtile.

**Example:**

To manually check the status or interact with the `mega-cmd` session, attach to the tmux session with:

```sh
tmux attach-session -t MEGA
```

---

> [!TIP]
> Consider adding error handling for situations where `tmux` or `mega-cmd` might not be installed or when there's an existing tmux session with the same name to avoid conflicts. Additionally, providing a means to cleanly terminate the session or restart it could enhance usability.