# dmenu_run_scripts.py

---

**dmenu_run_scripts.py**: A script to execute selected scripts using rofi with options from xonsh.

---

### Dependencies

- `python`: Required to run the Python script.
- `subprocess`: A built-in library to spawn new processes.
- `xonsh`: A shell language that combines Python syntax and shell syntax. Used for script identification.
- `rofi`: A customizable application switcher that serves as the dmenu replacement. It displays choices and allows selection.

### Description

This script serves as an interactive launcher that allows users to select and execute scripts dynamically. It begins by gathering a list of executable scripts through the `script_identifier.xsh`, which is a xonsh script. The specified criteria (like `HOST` and `STATUS=active`) filter the scripts to be displayed. 

The choices are formatted for visual clarity using markup, which colored the filename in green to enhance the user's selection experience. The filtered list is then piped into `rofi`, where users can interactively select a script. The selected script is executed, bringing convenience for users who frequently run various scripts from a defined set.

### Usage

To use this script, follow these steps:

1. Ensure all dependencies are installed on your Arch Linux machine.
2. Make the script executable by running:
   ```bash
   chmod +x /home/matias/.scripts/dmenu_run_scripts.py
   ```
3. Execute the script in your terminal or configure a keybinding in your window manager (qtile) to run it. For example:
   ```bash
   /home/matias/.scripts/dmenu_run_scripts.py
   ```
4. Select the desired script using the `rofi` interface.

Example of running the script in your terminal:

```bash
/home/matias/.scripts/dmenu_run_scripts.py
```

---

> [!TIP] 
This script relies heavily on the `script_identifier.xsh` for its functionality. Ensure that the `xonsh` script is correctly implemented and accessible. Additionally, consider adding error handling for cases where no script is selected or when `rofi` fails to launch properly. For better user experience, refine the choice extraction logic to ensure robustness.