# Toggle Picom (toggle_picom.sh)

---

A script to toggle the Picom compositor on and off.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Bash
- Picom

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to check whether the Picom compositor is currently running on your system. If it is running, the script stops it by using the `pkill` command; if it is not running, the script starts Picom in the background with the `-b` flag. 

Picom is an open-source compositor for X, providing features such as transparency and shadowing, enhancing the appearance and performance of graphical interfaces. By toggling Picom, you can easily manage your system's resource usage and visual effects according to your preference and needs.

The script utilizes the `pgrep` utility to search for processes by name, and its logic relies on the exit status of this command to determine whether to start or stop Picom.

---

<a name="usage" />

#### Usage

To use the script, simply run it from the command line:

```bash
bash toggle_picom.sh
```

You can also bind this script to a key combination in your window manager configuration (Qtile) for easier access. 

---

<a name="examples" />

#### Examples

1. Execute the script in terminal:

   ```bash
   bash /home/matias/.scripts/toggle_picom.sh
   ```

2. Assign the script to a keybinding in Qtile:

   ```python
   from libqtile import key
   from libqtile.command import lazy

   keys = [
       key.Key([mod], "p", lazy.spawn("/home/matias/.scripts/toggle_picom.sh")),
   ]
   ```

---

<a name="notes" />

### Notes

- Running `picom -b` starts it in the background, so it will not block your terminal while running.
- Ensure you have permissions to execute the script by running `chmod +x /home/matias/.scripts/toggle_picom.sh`.

> **Critique:**
> The script effectively achieves its intended purpose, but it could be enhanced with additional options. For instance, you might consider allowing users to specify flags for Picom directly through command-line arguments. Additionally, more descriptive output or logging could be useful for debugging and information purposes. Lastly, adding error handling for the `pkill` or `picom` commands would improve its robustness.