# Script to Select and Execute a Script (select_script)

---

A script that selects a chosen script using cached data and executes it.

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

- `rofi`: This script requires Rofi as a graphical dmenu to select scripts.
- C standard library functions for file handling and process execution.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `select_script` is a C program designed to help users select and execute their scripts efficiently. It reads script metadata from a cache file, uses Rofi for selection, and then executes the chosen script.

The key components of the script include:
- **Loading Cached Data**: Reads a CSV cache file that contains the names and descriptions of scripts.
- **Displaying Options**: Uses Rofi to display the list of scripts for selection, with enhanced markup for aesthetics.
- **Handling User Choice**: Captures the selected script and executes it directly.

The cache file is expected to be located at `~/.cache/script_info.csv`, and it lists scripts in the defined format:

```
filename,other_field1,other_field2,...,"description"
```

This structure allows easy expansion or customization.

---

<a name="usage" />

#### Usage

To use `select_script`, simply compile the C file and execute it from the terminal. It does not require any command-line arguments and can be launched directly with:

```sh
./select_script
```

Make sure that the necessary cache file exists and is formatted correctly before running the script.

<a name="examples" />

#### Examples

1. Compile the script:

    ```sh
    gcc -o select_script select_script.c
    ```

2. Run the script:

    ```sh
    ./select_script
    ```

3. Select a script from the Rofi menu and it will execute.

---

<a name="notes" />

### Notes

- Ensure the `HOME` environment variable is set correctly. The script checks this at runtime.
- The cache file should format the script names and descriptions correctly to be parsed without issues.

> **Critique:**
> - The script does not handle memory allocation failures, which could lead to potential crashes. Consider adding error checks after each `realloc` call.
> - Direct execution of scripts without validation can be risky. Implement checks to confirm the script exists and has the necessary permissions.
> - The Rofi commands are hard-coded and assume specific options. It would be beneficial to allow users to customize these settings through command-line arguments or configuration files.