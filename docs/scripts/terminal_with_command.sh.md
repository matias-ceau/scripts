# Terminal with Command

---

**terminal_with_command.sh**: Opens a floating terminal to run a command and see its output.

---

### Dependencies

This script requires the following dependencies:

- `alacritty`: A GPU-accelerated terminal emulator.
- `bash`: Ensures the script executes commands within an interactive bash shell.

### Description

This script is designed for users running the `qtile` window manager on Arch Linux and allows for opening a floating terminal window to run a specific command. By using `alacritty`, it creates a visually isolated and resizable floating terminal with the class name `floating` and the title `term_w_cmd`.

The executed command is passed as an argument to the script. The script makes use of the following key features:

- `"$@"`: This expands all arguments supplied in the script call.
- `exec "$SHELL"`: Ensures the shell stays open after the command finishes executing, allowing you to review the output.
  
The commented-out section in the script provides an alternative way to execute a command by determining its exact path using `which`. This has been replaced for flexibility.

### Usage

To use the script:

1. **Run the script with a specific command as an argument:**
   ```bash
   /home/matias/.scripts/bin/terminal_with_command.sh <command>
   ```

   For example, to check your IP address using `ip`:
   ```bash
   /home/matias/.scripts/bin/terminal_with_command.sh ip a
   ```

   The above command would open a floating `alacritty` window, execute `ip a`, and retain the terminal open for further exploration.

2. **Integration with Qtile Keybindings:**
   To enhance productivity, you can assign this script to a keybinding in your Qtile `config.py`. For instance:
   ```python
   Key([mod], "t", lazy.spawn(["/home/matias/.scripts/bin/terminal_with_command.sh", "htop"]), desc="Open floating terminal with htop")
   ```

---

> [!TIP]
> - The `$SHELL` variable resolves to the user's default shell. If you always want to use `bash`, consider replacing `exec "$SHELL"` with `exec /bin/bash`.
> - The commented-out lines could add value if commands provided as arguments need their full path; consider reintroducing them if necessary.
> - If using this script with commands that include special characters (like `&` or `|`), wrapping arguments in quotes or using stricter escaping may prevent parsing errors.