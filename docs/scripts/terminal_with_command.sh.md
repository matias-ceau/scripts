# Open Terminal with Command

---

**terminal_with_command.sh**: Opens a floating terminal to run a specified command and view its output

---

### Dependencies

- `bash`: A Unix shell and command language.
- `alacritty`: A fast, cross-platform, OpenGL terminal emulator. It must be installed on your system.
- `setsid`: A Unix utility to run a program in a new session.

### Description

This script allows you to open a terminal window that runs a specified command immediately upon opening, providing instantaneous feedback in a floating window. It utilizes `alacritty` with specific flags to ensure the terminal appears as a floating window, as determined by the window manager (`qtile` in your case).

The script checks the location of the command by using `which` and then launches it in an `alacritty` terminal instance with a custom title ("term_w_cmd") and a specific WM_CLASS attribute (`floating`). The specified command will be executed upon launching, and the terminal remains open for interaction.

### Usage

To execute the script, you'll need to pass the command you wish to run in the terminal as an argument. The script can be run directly from the terminal or bound to a keybinding in `qtile`.

```bash
./terminal_with_command.sh <your-command>
```

**Example:**

```bash
./terminal_with_command.sh htop
```

This will open an `alacritty` window, floating over your existing windows, and execute `htop`.

The script can be integrated into your `qtile` configuration as a custom shortcut for a seamless workflow.

---

> [!NOTE]
> This script currently only supports commands that are in your PATH. If the command is not found, the script might fail silently. It might be worth adding a check to ensure the command exists, providing feedback if it does not. Additionally, adding more customization options (such as adjusting alacritty's size or position) could enhance its flexibility.