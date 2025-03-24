# MegaSync Launcher

---

**megasync.sh**: Launches MegaSync with preserved Qt settings

---

### Dependencies

- `bash` – The Bourne Again SHell providing a standard shell interpreter.
- `megasync` – The MegaSync client, required for syncing files with Mega.

---

### Description

This script serves as a simple launcher for the MegaSync application. It ensures that certain environment variables set in relation to Qt are preserved when launching MegaSync. Specifically, it assigns the values for:

- DO_NOT_UNSET_QT_QPA_PLATFORMTHEME: Prevents Qt-related platform theme settings from being unset.
- DO_NOT_SET_DESKTOP_SETTINGS_UNAWARE: Inhibits modifications to desktop settings that might interfere with the user’s environment.

Both variables help maintain the intended behavior of the application's GUI by preventing automatic adjustments that could potentially disrupt the user interface on a custom desktop environment like qtile in Arch Linux. The script is minimalistic and direct; it simply sets these variables inline before invoking the `megasync` command, leveraging shell variable assignment for a single command execution context.

---

### Usage

To use this script, first ensure that it has executable permissions. You can set the proper permissions by running:

chmod +x /home/matias/.scripts/dev/megasync.sh

This script can be executed from a terminal or can be bound to a key combination within qtile. For instance, to run it from the terminal, use:

/home/matias/.scripts/dev/megasync.sh

Alternatively, if you use a keybinding manager in qtile, bind the key combination to execute this script. The inline assignment of environment variables allows you to keep your Qt application consistent with your desktop theme and settings without affecting the global environment.

---

> [!TIP]
> Consider adding logging or error handling in case `megasync` is not installed or fails to launch properly, which could improve troubleshooting. Additionally, maintaining a configuration file for such environment variables might offer greater flexibility than hardcoding them into the script.