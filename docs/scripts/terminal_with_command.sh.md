# Terminal With Command

---

**terminal_with_command.sh**: Opens a floating terminal to run a command and see the output.

---

### Dependencies

- `alacritty`: A modern terminal emulator that supports advanced features like window management. This script requires `alacritty` to create a floating terminal.

### Description

The `terminal_with_command.sh` script is designed to open a floating terminal window that executes a specified command while allowing the user to view the output in real-time. This can be particularly useful for long-running processes or commands where monitoring output is necessary without taking up screen real estate.

The script works by first locating the command specified as an argument. It uses the `which` command to get the path of the command and stores it in the `cmd` variable. The `setsid` command is then used to start `alacritty`, passing the command to be executed along with a bash shell to keep the terminal open after the command completes. The terminal window is titled "floating", and the user is presented with a shell after the command's execution, allowing for further interaction.

### Usage

To use this script, follow these steps:

1. Make sure to give the script executable permissions:
   ```bash
   chmod +x /home/matias/.scripts/terminal_with_command.sh
   ```

2. Invoke the script followed by the command you want to run. The command must be accessible by your user profile.
   ```bash
   /home/matias/.scripts/terminal_with_command.sh <command>
   ```

   For example:
   ```bash
   /home/matias/.scripts/terminal_with_command.sh top
   ```

   This will open a floating terminal running the `top` command, allowing real-time monitoring of system processes.

---

> [!TIP]  
> One potential improvement for this script is to check if the command exists before attempting to execute it. If the command is not found, the script could notify the user with an appropriate message instead of failing silently or opening an empty terminal. Adding error handling could enhance user experience.