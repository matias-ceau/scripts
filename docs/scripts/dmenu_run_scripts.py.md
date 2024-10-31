# Dmenu Run Scripts with Rofi

---

**dmenu_run_scripts.py**: Launch scripts using `rofi` for selection, filtered by `xonsh`

---

### Dependencies

- `python`: The script is written in Python and requires Python to execute.
- `xonsh`: A Python-powered, Unix-gazing shell used here to generate a list of script choices.
- `rofi`: A window switcher, application launcher, and dmenu replacement, used to present and select from the list of script choices.
- `script_identifier.xsh`: A custom script likely written in `xonsh`, utilized here to fetch the scripts based on certain criteria.

### Description

This script offers a user-friendly interface for selecting and running scripts on your Arch Linux system using the `rofi` tool as an interactive menu. The steps in the script flow as follows:

1. It utilizes `xonsh` to execute `script_identifier.xsh` with specific parameters, filtering scripts flagged as active and formatted in a certain style.
2. The filtered list of scripts is then passed to `rofi`, which displays them in a selectable menu.
3. Upon user's selection, the script extracts the choice from `rofi`'s output.
4. Finally, it executes the selected script.

The approach allows dynamic, condition-based listing and execution of scripts, ideal for large collections of custom scripts needing quick access and execution.

### Usage

To use this script, ensure it is executable and run it like so:

```sh
$ /home/matias/.scripts/bin/dmenu_run_scripts.py
```

`rofi` will then pop up with the list of available scripts fetched by `xonsh`. Navigate through the list, select the script you want to run, and press Enter.

This script can be assigned to a keybinding in your qtile configuration for even quicker access, enhancing your workflow efficiency.

---

> [!TIP]
> One improvement could be to handle any exceptions, such as handling empty selections or errors in executing the selected script. This can enhance the robustness of the script against unexpected failures during script execution.