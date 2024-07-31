# Script Launcher (script_launcher.sh)

---

Run scripts with fzf in a user-friendly interface.

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

- `fd`: A simple, fast, and user-friendly alternative to `find`
- `fzf`: A fuzzy finder for the command line
- `bat`: A cat(1) clone with wings, providing syntax highlighting and Git integration
- `improved-fzfmenu.sh`: A custom fzf script that enhances menu functionalities

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `script_launcher.sh` script is designed to provide a convenient way to run various user scripts stored in a specified directory. It utilizes `fd` to search for scripts in the `$SCRIPTS` directory, then uses `xargs` to prepare the results for fzf, which presents an interactive fuzzy search interface. Selected scripts can be previewed using `bat`, and upon selecting a script and pressing Enter, it executes in a new Bash shell.

This approach streamlines the process of locating and running scripts, especially for users who manage multiple script files and prefer a visual, interactive method. The use of `bat` for previewing adds an extra layer of clarity, as it highlights the scripts' contents.

---

<a name="usage" />

#### Usage

To run the script, ensure that you have all necessary dependencies installed. Simply execute the script from a terminal:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

This will trigger `fzf`, allowing you to search and select scripts. 

### Key Features:
- Type to search for the desired script.
- View a preview of the script's contents before execution.
- Press Enter to run the script in a new Bash session.

<a name="examples" />

#### Examples

1. Open terminal and run:
    ```bash
    bash /home/matias/.scripts/script_launcher.sh
    ```
2. Start typing the name of the script you want to execute to filter results.
3. Use the arrow keys to navigate and press Enter to run the selected script.

---

<a name="notes" />

### Notes

- Ensure that the `$SCRIPTS` environment variable is correctly set to point to the directory containing your scripts.
- The script's execution context will inherit environment variables from the terminal where it was launched.

> **Critique**: 
> - The script could benefit from error handling to manage cases where no scripts are found. 
> - Additionally, further enhancements could include customizable search parameters or filtering options.
> - It may also be beneficial to allow for multi-selection in `fzf` for running several scripts at once.