# terminal_with_command.sh

---

**terminal_with_command.sh**: Opens a floating Alacritty terminal to execute a given command, showing output and staying open.

---

### Dependencies

- `alacritty` — GPU-accelerated terminal emulator (required for window class and title support).
- `bash` — The default shell for command execution.
- `qtile` (environment context) — Floating window support configured within your qtile setup.
- (Optional) Any command you wish to run in the floating terminal.

---

### Description

This script is designed to launch a floating terminal window under the `qtile` window manager on Arch Linux, immediately executing the command(s) you pass as arguments. It utilizes `alacritty`, setting the window title to `term_w_cmd` and the window class to `floating`, making it easy to manage its floating behavior via qtile rules. After executing the provided command, the script keeps the shell open (`exec "$SHELL"`), allowing you to inspect output or run further commands interactively.

By leveraging `-e bash -i -c`, the script ensures commands run in an interactive session, so aliases and functions are available and the environment is set up as in a normal shell. Passing `"$@"` ensures all arguments are interpreted as a single command with arguments, preserving quoting.

---

### Usage

You can invoke the script from anywhere, e.g. within keybindings, scripts, or directly from a terminal.

**Basic usage:**
```
terminal_with_command.sh <command> [arguments]
```
**Examples:**
```
terminal_with_command.sh htop
terminal_with_command.sh nvim ~/notes/todo.md
terminal_with_command.sh bash -c "echo Hello && sleep 5"
```
_Note:_ You can assign this script to a keybinding in your qtile config to rapidly run diagnostics, editors, or monitoring tools in a floating terminal.

---

> [!NOTE]
> - The script does not validate command existence, so typos or missing commands will simply result in an error message inside the terminal window.
> - The script assumes `alacritty` is installed and in the PATH; this won’t work with other terminal emulators unless modified.
> - If you want more flexibility (e.g. alternate terminal emulators or improved error handling), you could parameterize the terminal command and include checks for the command’s existence.
> - Using `"$@"` with a leading `_` as `$1` inside the script (`"$@"` after `_`) is a bash pattern to preserve all original arguments exactly, but if no command is given, the terminal will open to a shell prompt. If you would prefer to display a usage message or error, add a command presence check at the beginning.