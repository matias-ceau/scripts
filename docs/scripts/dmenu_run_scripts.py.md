
# Dmenu-like Script Launcher

---

**dmenu_run_scripts.py**: Invoke user scripts via dmenu-like interface using `rofi`.

---

### Dependencies

- `xonsh`: A Python-powered, Unix-gazing shell for executing script identification logic.
- `rofi`: A window switcher, application launcher, and dmenu replacement, for displaying script options.

### Description

This script acts as a dmenu-like application launcher specifically for user scripts. It follows these main steps:

1. **Script Identification**: It first uses a Xonsh script (`script_identifier.xsh`) to retrieve a list of available scripts filtered by certain criteria (`TYPE=RUN`, `STATUS=active`). The output is formatted with script filenames and descriptions.

2. **Selection Interface**: The script leverages `rofi` to display these options in a menu, allowing you to choose which script to run with an easy-to-navigate interface.

3. **Execution**: Once a choice is made, the selected script file is executed.

This method provides a smooth user experience, blending the power of shell scripting with a graphical selection utility.

### Usage

To utilize this script, follow these steps:

1. **Prepare the Xonsh Script**: Ensure `script_identifier.xsh` is present and correctly configured to identify active scripts.

2. **Run the Script**:
   Execute the script directly from the terminal. It can be bound to a keybinding for quick access in qtile or executed manually:
   ```bash
   python /home/matias/.scripts/bin/dmenu_run_scripts.py
   ```

3. **Interacting with the Menu**:
   Once executed, a `rofi` menu will appear listing active scripts. Select a script using the keyboard or mouse, and press enter to execute.

This script is ideal for Arch Linux users with a qtile environment who want an efficient way to manage and launch custom scripts.

---

> [!TIP]
> Ensure that the choices extracted by `rofi` are accurately captured and that scripts are executable without issues. The script assumes that `script_identifier.xsh` is correctly identifying and formatting active scripts. Errors in this script can lead to execution failure if file paths or identifiers are incorrect. Additionally, if no choices are available, `rofi` will not display any options, so make sure the Xonsh script returns valid results. Consider adding error handling to check if the choice is valid before attempting to execute it.