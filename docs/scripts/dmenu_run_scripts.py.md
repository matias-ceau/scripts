# Script Selector & Executor

---

**dmenu_run_scripts.py**: A Python script to display executable scripts and run selected ones.

---

### Dependencies

- `python`: The script is written in Python and requires Python to execute.
- `xonsh`: A shell that combines Python and Bash functionalities, used to fetch available scripts.
- `rofi`: A window switcher, application launcher, and dmenu replacement used for selecting scripts interactively.

### Description

This script is designed to mimic the functionality of `dmenu_run` by listing available scripts sourced from a separate `.xsh` file, allowing users to select and execute one of these scripts. The process involves the use of `xonsh` to gather script information such as the name and description with a predefined format, using `rofi` to present this list in a structured way to the user, and finally executing the selected script.

1. **Choices Generation**: The script uses `xonsh` to run `script_identifier.xsh` with specific arguments, filtering for "active" scripts and formatting the output nicely with green colored text.
   
2. **User Interaction**: The output from the `xonsh` command serves as the input for `rofi`, which presents a scrollable list (30 lines in height and 80% of the screen width).

3. **Execution**: After a selection is made, the script parses the chosen item and executes the corresponding command.

### Usage

To use the script, simply execute it in the terminal:

```bash
python /home/matias/.scripts/dmenu_run_scripts.py
```

Ensure that `script_identifier.xsh` is configured correctly to list your desired scripts and that `rofi` is installed and running. The script will open a graphical menu where you can choose which script to run. Select the item and press `Enter` to execute it.

---

> [!TIP]
> - The script assumes that `script_identifier.xsh` will provide valid command output. It might be beneficial to add error handling for cases where there is no output or the output is malformed.
> - Ensure that the scripts listed have execution permissions, otherwise, the script will fail silently.
> - Consider extending the script to optionally log executions or include additional filtering options through command-line arguments.