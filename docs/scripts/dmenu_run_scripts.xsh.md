# Run User Scripts with Dmenu (dmenu_run_scripts.xsh)

---

Run user scripts in an interactive menu powered by dmenu/rofi.

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

- `xonsh`: A Python-powered shell
- `dmenu` or `rofi`: For providing the interactive script menu
- `script_identifier.xsh`: A user script to identify scripts to run

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script leverages `xonsh` to present an interactive menu for executing user scripts. The core functionality involves calling the `script_identifier.xsh`, which filters scripts marked for running, and utilizes `rofi` to provide a user-friendly interface. 

The choices are formatted with color for better visibility, using markup to enhance the appearance in the `rofi` interface. Users can select a script from the list, and upon selection, the corresponding script is run dynamically.

The script operates as follows:
1. It runs `script_identifier.xsh` with specific parameters to get a list of active scripts.
2. The output is processed using `rofi` to allow the user to choose from the list.
3. The selected script is then executed.

---

<a name="usage" />

#### Usage

To execute the script, simply run it in your terminal:

```shell
bash /home/matias/.scripts/dmenu_run_scripts.xsh
```

You can also bind it to a key in your window manager (`qtile`) to allow quick access. 

For example, you can add the following line to your `~/.config/qtile/config.py` to bind it to a key combination (e.g., `Mod4 + R`):

```python
Key([mod], "r", lazy.spawn("/home/matias/.scripts/dmenu_run_scripts.xsh")),
```

<a name="examples" />

#### Examples

1. **Run the Script**: 
   - Execute from terminal:
   ```shell
   /home/matias/.scripts/dmenu_run_scripts.xsh
   ```

2. **Keybinding in Qtile**:
   - Add the line mentioned above in your Qtile configuration.

---

<a name="notes" />

### Notes

- Ensure that your `script_identifier.xsh` script is functional and returns the expected output.
- The script currently relies on the `rofi` utility for dmenu-like behavior; ensure `rofi` is installed on your system.
- The current implementation may require you to customize the script_identifier file path or its behavior based on your user scripts setup.

> **Critique**:
> - Consider adding error handling for situations where no scripts are returned from `script_identifier.xsh`.
> - You might also enhance the user experience with additional options, such as previewing scripts or filtering options within the menu.