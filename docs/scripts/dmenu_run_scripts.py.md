# dmenu_run_scripts.py

---

A script to run commands using rofi and choices from an xonsh script.

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

- Python 3
- xonsh
- rofi

<a name="description" />

### Description

<a name="overview" />

#### Overview

`dmenu_run_scripts.py` is a Python script designed to enhance the usability of command invocation through a graphical interface. It fetches executable commands from an external script (`script_identifier.xsh`) using the xonsh shell, which generates options based on specified parameters. The script effectively combines this output with the `rofi` dmenu, allowing the user to manage and execute commands more intuitively.

The flow of the script is as follows:
1. **Fetch Choices**: The script invokes an xonsh script to generate a list of available commands formatted for display.
2. **Display and Selection**: The list is passed to `rofi`, where the user can visually select an option.
3. **Execution**: Upon selection, the chosen command is executed instantly.

---

<a name="usage" />

#### Usage

To use `dmenu_run_scripts.py`, you need to ensure that both `xonsh` and `rofi` are installed and configured properly on your Arch Linux system. The script can be run directly from a terminal. Optionally, you can bind it to a keyboard shortcut in your window manager (e.g., Qtile) to facilitate faster access.

Execute the script with the following command:

```bash
python /home/matias/.scripts/dmenu_run_scripts.py
```

---

<a name="examples" />

#### Examples

Here's a quick overview of how to invoke the script:

```bash
# Simple invocation
python /home/matias/.scripts/dmenu_run_scripts.py
```

Once run, a rofi interface will appear displaying the commands from `script_identifier.xsh`. Simply type or navigate to choose a command, and hit Enter to execute it.

---

<a name="notes" />

### Notes

- Ensure that `script_identifier.xsh` exists and is executable; otherwise, the script will not function.
- The command output should be formatted correctly for `rofi` to display it properly, which is handled in the command parameters.

> **Critique**: 
> - The script assumes that the output from `rofi` will always contain a valid command. Consider adding error handling to manage cases where the user cancels the selection.
> - There’s a hard-coded dependency on formatting within the `rofi` command. Future enhancements could parameterize these formats for a more flexible configuration.
