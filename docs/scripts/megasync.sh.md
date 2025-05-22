# Megasync Arch/Qtile Launcher

---

**megasync.sh**: Launches MEGAsync with specific environment variables set for Qtile/Arch environments

---

### Dependencies

- `megasync`: Official MEGA desktop sync client for Linux.
- `bash`: Standard GNU Bourne Again SHell interpreter.

### Description

This launcher script starts the `megasync` client, but ensures two key environment variables are set for compatibility in non-standard desktop environments (like Qtile):

- `DO_NOT_UNSET_QT_QPA_PLATFORMTHEME=1`: Prevents MEGAsync from unsetting the `QT_QPA_PLATFORMTHEME` variable, which can be crucial for consistent theming and font rendering under Qtile or non-GNOME/KDE WMs.
- `DO_NOT_SET_DESKTOP_SETTINGS_UNAWARE=1`: Tells MEGAsync not to mark itself as "unaware" of desktop environment settings, improving appearance and possibly notification behavior on Arch/Qtile setups.

This script is especially useful if you experience MEGAsync theming glitches or settings issues with your custom window manager.

The script is written for Arch Linux with the Qtile WM, but will work on any system (primarily X11) where these issues occur.

### Usage

#### TL;DR

```shell
~/.scripts/dev/megasync.sh
```

- You can run this directly in your terminal, or assign it to a key binding in Qtile (see below).

#### Qtile Keybinding Example

Add to your `~/.config/qtile/config.py`:
```python
Key([mod], "m", lazy.spawn("~/.scripts/dev/megasync.sh"), desc="Launch MEGAsync with env fixes")
```

#### Autostart Example

Add to your Qtile autostart script (e.g. in `~/.config/qtile/autostart.sh`):
```bash
~/.scripts/dev/megasync.sh &
```

---

> [!TIP]
> **Critique & Suggestions:**  
> - This script is minimal and does its job, but it lacks error checking (e.g., if `megasync` is not installed, it will just fail silently).  
> - Inline export of variables is clear, but if you add more variables or logic, consider using the `export` command for better readability and maintainability.  
> - For logging or troubleshooting, you might want to redirect stdout/stderr to a simple log file.  
> - Consider a shebang portability tweak (`#!/usr/bin/env bash`) for improved robustness across systems.  
> - If you have other apps with similar needs, generalizing this script to wrap arbitrary commands with custom environment variables may be useful.  
