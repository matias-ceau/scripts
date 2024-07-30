# Toggle Picom (toggle_picom.sh)

---

A simple script to toggle the Picom compositor on and off.

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

- `picom`: A compositor for X11, to handle window effects.
- `pgrep`: To check if Picom is running.
- `pkill`: To stop Picom if it is running.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `toggle_picom.sh` script is designed to conveniently start or stop Picom, a popular compositor for various window managers like Qtile. This script checks if Picom is currently running by utilizing `pgrep`, which searches for the Picom process. Based on the result, it either terminates the Picom process with `pkill` or initiates it in the background with the `-b` flag to allow the terminal to be free for further commands.

The script provides visual feedback in the terminal, letting the user know whether Picom is currently running or was just started. Because window compositors can greatly affect the visual experience in a desktop environment, this script serves as a handy tool for users who frequently switch their compositor on and off.

---

<a name="usage" />

#### Usage

To use this script, simply execute it from the terminal with the following command:

```bash
bash /home/matias/.scripts/toggle_picom.sh
```

Alternatively, this script can be bound to a key combination in your Qtile configuration for ease of access, allowing you to quickly toggle Picom without needing to open a terminal.

<a name="examples" />

#### Examples

1. **Toggle Picom from Terminal**:
   ```bash
   bash /home/matias/.scripts/toggle_picom.sh
   ```

2. **Bind to a key in Qtile**:
   ```python
   Key([mod], "p", lazy.spawn("/home/matias/.scripts/toggle_picom.sh")),
   ```

---

<a name="notes" />

### Notes

- Ensure the script has execute permissions. You can set this using:
  ```bash
  chmod +x /home/matias/.scripts/toggle_picom.sh
  ```
- The script relies on the assumption that Picom is installed and accessible in the command path.

> **Critique**: 
> - The script could benefit from error handling to catch cases where Picom fails to start or stop. Implementing conditions to check the exit status of `pkill` and `picom` commands would enhance its robustness.
> - Consider adding additional options for Picom's startup parameters to allow users to customize their experience further.