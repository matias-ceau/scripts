# Floating Terminal with Command 

---

**terminal_with_command.sh**: Opens a floating terminal to run a command and see the output.

---

### Dependencies

- `alacritty`: A terminal emulator that supports floating windows; ensure it is installed and configured.

### Description

This script is designed to launch a floating terminal window using `alacritty`, allowing the user to run a specified command while also keeping the shell open for further interaction. When passed a command as an argument, the script first resolves the command's path using `which`, and then opens `alacritty` with that command. The shell will remain open after the command is executed, enabling users to inspect the output and run additional commands as needed.

The key components of the script are:
- **Command Retrieval**: It utilizes the `which` command to retrieve the full path of the input command, ensuring the terminal can execute it correctly.
- **Floating Window**: The `-T 'floating'` option designates the terminal as a floating window, which is particularly useful in window managers like `qtile` for better workspace management.

### Usage

To use this script, you must provide the command you wish to run as an argument. The script is executed from a terminal or can be bound to a key in `qtile`.

Here’s a simple example of how to use the script:

```bash
./terminal_with_command.sh your_command
```

Replace `your_command` with the command you want to run in a floating terminal. For instance, to open a floating terminal running `htop`, you would execute:

```bash
./terminal_with_command.sh htop
```

---

> [!TIP]
> The script does not handle errors that could arise if the specified command does not exist or is not executable. You might consider adding checks to provide user feedback in such cases, enhancing the user experience. For instance, implementing a conditional to verify if `cmd` is empty before attempting to open `alacritty` would prevent accidental runtime errors.