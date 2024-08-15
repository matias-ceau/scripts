# Toggle Picom

---

**toggle_picom.sh**: Script to toggle the Picom compositor on and off.

---

### Dependencies

- `picom`: A compositor for X11 which provides features like transparency and shadows.
- `notify-send`: A utility to create desktop notifications.

### Description

This script serves to control the Picom compositor running on your Arch Linux system with a qtile window manager. It checks if Picom is currently running by using the `pgrep` command. If Picom is found running, it will terminate the process using `pkill` and send a notification indicating that Picom is being stopped. Conversely, if Picom is not running, it will launch it in background mode with the `-b` flag and notify the user that it is starting.

**Key elements of the script include:**

- **Process Checking**: The use of `pgrep -x "picom"` to check if Picom is active.
- **Notifications**: Leveraging `notify-send` to inform the user about the script's actions (starting or stopping Picom).
- **Process Management**: Managing the Picom process with `pkill` for termination and simply invoking `picom -b` to start it in the background.

### Usage

To use the script, ensure it has execute permissions and run it from a terminal or link it with a keybinding in your window manager. 

1. **Make it executable**:
   ```bash
   chmod +x /home/matias/.scripts/toggle_picom.sh
   ```

2. **Run the script**:
   You can run the script manually with:
   ```bash
   /home/matias/.scripts/toggle_picom.sh
   ```

3. **Example Keybinding (for qtile)**:
   You might want to add it to your qtile configuration:
   ```python
   Key([mod], "p", lazy.spawn("/home/matias/.scripts/toggle_picom.sh")),
   ```

---

> [!TIP]  
> This script is simple and effective; however, it implicitly relies on `notify-send` being available. To make it more robust, consider checking if `notify-send` exists and providing an error message otherwise. Additionally, implementing command-line arguments for customizing Picom's run options could enhance its usability for advanced users.