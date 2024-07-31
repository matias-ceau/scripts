# dmenu_run_scripts.py

---

A script to select and run scripts using rofi, inspired by dmenu_run.

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
- Shell scripts required by `script_identifier.xsh`

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script leverages Python's subprocess module to interact with shell commands for a streamlined script-launching experience. It retrieves a list of available scripts by executing `script_identifier.xsh` configured to provide specific output formatted to be parsed. After acquiring these choices, it uses the `rofi` program to present a user interface for selection.

1. **Subprocess Management**: It utilizes `subprocess.run()` to execute shell commands and capture outputs efficiently.
2. **Choice Formatting**: The choices fetched contain markup (using span tags and colors) that `rofi` interprets. The script uses these features to enhance the visualization of options available to the user.
3. **Execution**: Once the user makes a selection from the `rofi` interface, the corresponding script is executed directly.

---

<a name="usage" />

#### Usage

To run this script:

1. Ensure that the dependencies listed above are installed.
2. Execute the script from the terminal:

```bash
python /home/matias/.scripts/dmenu_run_scripts.py
```

If you want to bind this script to a key combination in your window manager (qtile), you could add a configuration similar to the following in your `config.py`:

```python
keys = [
    Key([mod], 'r', lazy.spawn('python /home/matias/.scripts/dmenu_run_scripts.py')),
]
```

<a name="examples" />

#### Examples

1. Run the script via terminal:

   ```bash
   python /home/matias/.scripts/dmenu_run_scripts.py
   ```

   This will present a list of active scripts.

2. Select a script from the graphical interface provided by `rofi`, and the selected script will run.

---

<a name="notes" />

### Notes

- Make sure that `script_identifier.xsh` is executable and returns properly formatted output so that the subsequent processing step runs without errors.
- The script strips the selection of leading/trailing whitespace, so ensure your options are cleanly defined to avoid execution errors.

> **Critique**:
> 
> The script could benefit from error handling, particularly in areas where subprocess calls might fail. For instance, handling cases where `script_identifier.xsh` returns no valid choices or where the user's selection fails to execute should be considered. Additionally, providing more context to the user when no options are available or when an error occurs could enhance user experience.