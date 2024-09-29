# dmenu_run_scripts.py

---

**dmenu_run_scripts.py**: A script to select and run scripts using rofi with custom output formatting.

---

### Dependencies

- `subprocess`: A built-in Python module to spawn new processes, connect to their input/output/error pipes, and obtain their return codes.
- `xonsh`: A shell that can run Python code with additional features; required to run the script that provides options for the user.
- `rofi`: A window switcher and application launcher; it is used to present the user with a selectable list of choices.

### Description

This script enables users to run scripts dynamically using `rofi`, a powerful launcher that displays a graphical menu. It first retrieves a list of script choices from an `xonsh` script named `script_identifier.xsh`, filtering for scripts that are marked as `active`. The output is formatted with markup for better visual distinction in the `rofi` interface. 

The central logic comprises the following steps:

1. **Collecting Choices**: The script invokes `script_identifier.xsh` with specific filters. It pipes the output to `rofi` to allow users to select one from a list.
   - The command makes use of various parameters to ensure only active scripts with a specific format are returned.

2. **Displaying Choices**: Once the script list is fetched, `rofi` is used for a user-friendly interface where a selection can be made.

3. **Execution**: Upon selection, the chosen script is executed directly.

This method creates a seamless workflow for users to execute scripts with minimal effort.

### Usage

To use this script, simply run it in your terminal. You can execute it directly or bind it to a key in your window manager (e.g., qtile):

```bash
python /home/matias/.scripts/dmenu_run_scripts.py
```

Example keybinding for qtile configuration (`config.py`):

```python
from libqtile import key
from libqtile.command import lazy

keys = [
    key.Key(["mod4"], "d", lazy.spawn("python /home/matias/.scripts/dmenu_run_scripts.py")),
]
```

Upon running, a `rofi` menu will pop up, showing the available script options based on the filtering criteria set in `script_identifier.xsh`.

---

> [!TIP]  
> This script relies on the selection from `rofi` to include valid choices, but there is no error handling for cases when no choice is made. Consider adding validation to handle if `rofi` output is empty or if an invalid command is selected. Additionally, ensure that the necessary scripts and dependencies like `xonsh` and `rofi` are installed to avoid runtime errors.