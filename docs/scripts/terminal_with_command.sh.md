# Floating Terminal Command Runner

---

**terminal_with_command.sh**: Opens a floating terminal to run a command and see the output.

---

### Dependencies

- `alacritty`: A modern terminal emulator that is required to display the floating terminal window.
- `bash`: The shell in which the command is executed.

### Description

The `terminal_with_command.sh` script allows users to open a floating terminal window that executes a specified command and displays its output. This can be particularly useful for running scripts or commands while maintaining visibility on other desktop applications, making multitasking efficient.

When the script is executed, it leverages the `which` command to locate the full path of the provided command argument. The script then utilizes `setsid` to start a new process group which helps in managing the terminal session independently. The terminal is launched using `alacritty`, with the title set to `term_w_cmd`, and categorized under the 'floating' class for appropriate window management.

The command is executed in a bash shell, and after the command completes, it keeps the terminal open by executing `exec $SHELL`.

### Usage

To use the script, you need to pass the command you want to run as an argument. Here's how you can do this:

1. Make the script executable (if not already done):
   ```bash
   chmod +x /home/matias/.scripts/terminal_with_command.sh
   ```
   
2. Run the script with the desired command:
   ```bash
   /home/matias/.scripts/terminal_with_command.sh <command>
   ```
   For example, to run the `htop` command in a floating terminal, you would use:
   ```bash
   /home/matias/.scripts/terminal_with_command.sh htop
   ```

You can also bind this script to a key in your window manager (qtile) to access it more easily.

---

> [!TIP]  
> Consider including error handling in the script for cases when the command isn’t found or if `alacritty` isn't installed. This would greatly enhance user experience and prevent unexpected failures. Additionally, allowing multiple commands to be executed sequentially could provide more flexibility.