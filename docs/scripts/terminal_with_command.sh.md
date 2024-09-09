# Floating Terminal Command Runner

---

**terminal_with_command.sh**: Opens a floating terminal to run a specified command.

---

### Dependencies

- `alacritty`: A terminal emulator that supports custom configurations and tiling features.
- `bash`: The Bourne Again SHell, used for running shell commands.

### Description

This script is designed to open a floating terminal window (specifically using Alacritty) and execute a command provided by the user. The terminal opens in a designated floating state, allowing users to see the output of the executed command clearly without disrupting their workflow.

The script achieves this by first determining the full path of the command you want to run using the `which` command. It then launches Alacritty with the `setsid` command, allowing the terminal to run independently of the parent shell. The command is executed within a Bash shell, and after its execution, a new shell is initiated (`exec $SHELL`) to keep the terminal open for further interaction.

### Usage

To use the script, follow these steps:

1. Make sure the script is executable. You can set the executable permission with:
   ```bash
   chmod +x /home/matias/.scripts/terminal_with_command.sh
   ```

2. Run the script by passing the command you wish to execute as an argument:
   ```bash
   /home/matias/.scripts/terminal_with_command.sh <command>
   ```

   For example, to open a floating terminal to list files in your home directory, you would execute:
   ```bash
   /home/matias/.scripts/terminal_with_command.sh ls ~
   ```

---

> [!TIP]  
> Consider adding error handling for cases where the command does not exist or is invalid. You could improve user experience by providing feedback if the command fails to execute, such as displaying an error message in the terminal. Additionally, you might want to allow multiple commands or provide options for terminal customization (like size, color scheme, etc.).