# Terminal with Command

---

**terminal_with_command.sh**: Opens a floating terminal to run a command and see the output.

---

### Dependencies

- `alacritty`: A GPU-accelerated terminal emulator that must be installed for this script to run.
  
### Description

This script allows users to open a floating terminal window that executes a specified command, displaying its output interactively. The terminal window is created using `alacritty`, which provides a lightweight and performant interface.

The script leverages the `setsid` command to start a new session for the terminal window, ensuring that it runs independently of any terminal that might have launched it. The command to be executed is fetched using the `which` command to resolve the full path of the executable.

The terminal is titled "floating" and executes the provided command in a new bash instance. After the command finishes executing, the shell remains open, allowing users to interact further within that terminal session.

### Usage

To use the script, simply run it from the terminal and provide the desired command as an argument. 

```bash
./terminal_with_command.sh <command>
```

Example:

```bash
./terminal_with_command.sh nano /path/to/file.txt
```

In this example, a floating terminal will open running `nano` to edit `file.txt`. After exiting `nano`, the terminal will remain open.

You can also bind this script to a key in your window manager (e.g., qtile) for quicker access to commonly used commands.

---

> [!TIP]  
> The script currently does not handle cases where the command provided does not exist or is not executable. Adding error handling to inform the user if the command cannot be found or executed would greatly enhance user experience. Additionally, consider making the terminal's title dynamic, reflecting the command being executed.