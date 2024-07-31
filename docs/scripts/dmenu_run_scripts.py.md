# dmenu_run_scripts - A dynamic script launcher using rofi

---

**[dmenu_run_scripts.py](dmenu_run_scripts.py)**: A Python script to dynamically run scripts using rofi as a dmenu alternative.

---

### Dependencies

- `python`: Needed to run the script as it is written in Python.
- `xonsh`: A shell that can execute the `script_identifier.xsh` script.
- `rofi`: A window switcher, application launcher, and dmenu replacement.

### Description

The `dmenu_run_scripts.py` script allows users to dynamically launch executable scripts using `rofi` for a graphical selection interface. This script leverages `subprocess` to interact with both `xonsh` and `rofi`. 

Here’s a breakdown of the script's functionality:

1. **Choice Retrieval**:
   - The script first retrieves executable choices from `script_identifier.xsh` using `xonsh`. It runs a command that filters the available scripts based on criteria such as `HOST` and `STATUS=active`. The results are formatted in a way that highlights the script name in green with additional descriptions.

2. **User Selection**:
   - The choices are then passed into `rofi`, allowing the user to select one from a list presented in a styled format. The `rofi` commands set parameters like the number of lines displayed, case-insensitivity, and markup support to enhance the user experience.

3. **Executing the Choice**:
   - After selection, the script extracts the chosen item from `rofi` output and executes the corresponding script utilizing `subprocess.run`.

### Usage

To use this script, simply run it from your terminal. Make sure all prerequisites are installed and that `script_identifier.xsh` is set up correctly.

```bash
python /home/matias/.scripts/dmenu_run_scripts.py
```

This will launch `rofi`, displaying all available scripts. Select one and press Enter to execute it.

Alternatively, you can bind this script to a key in your window manager (Qtile) for quick access:

```python
# Example of a key binding in Qtile config.py
Key([mod], "d", lazy.spawn("/home/matias/.scripts/dmenu_run_scripts.py")),
```

---

> [!TIP]  
> Consider adding error handling for subprocess calls to manage cases where scripts may not execute as expected or if `rofi` fails to display choices. Additionally, it may be beneficial to cache results from `script_identifier.xsh` to reduce execution time for frequently used scripts.
