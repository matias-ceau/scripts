# Terminal with Command Launcher

---

**terminal_with_command.sh**: Opens a floating terminal window to execute a specified command.

---

### Dependencies

- `alacritty`: A modern terminal emulator focusing on performance.
- `setsid`: Utility that runs a program in a new session, detaching the process.
- `bash`: The Bourne Again SHell, which is a default UNIX shell.

### Description

The `terminal_with_command.sh` script is designed to enhance productivity in a desktop environment by launching a floating terminal window to execute a given command and remain open afterward. This is especially useful for quick monitoring of command outputs or when a command requires attention after execution.

The script uses the `alacritty` terminal to maintain a lightweight and efficient user experience. Labels such as `-T term_w_cmd` and `--class 'floating'` are used to assign a specific title and window class to the terminal, allowing for easy window management, as seen in window managers like qtile.

The `cmd="$(which "$1")"` line ensures that the script resolves the absolute path of the intended command, minimizing errors due to misconfiguration of `$PATH`.

### Usage

Below is an example of how to use this script:

```bash
./terminal_with_command.sh ls
```

This command will open an `alacritty` terminal window floating above other windows and execute the `ls` command.

- **Keybinding:** Assigning this script to a keybinding in qtile can further streamline your workflow.
- **Interactive Execution:** Run directly from a terminal if needed, simply by providing a desired command as an argument.

```bash
./terminal_with_command.sh htop
```

This would launch `htop` in a floating terminal session, allowing you to monitor system processes easily.

---

> [!NOTE]  
> While the script provides a handy tool for opening terminal windows with specific commands, it does not handle cases where the command is not found or invalid. Implementing error-checking for command existence or offering user-friendly feedback when an issue arises might enhance the usability of the script. Additionally, allowing for command arguments could make the script more versatile.