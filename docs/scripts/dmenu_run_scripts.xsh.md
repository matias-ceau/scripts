
---

Run user scripts with dmenu.

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

- xonsh
- dmenu (or rofi)
- script_identifier.xsh (user script for listing scripts)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `dmenu_run_scripts.xsh` is a script designed to facilitate the execution of user scripts using dmenu, a popular application launcher that displays a list of options for the user to choose from. In this implementation, it utilizes `rofi` for a more feature-rich interface, allowing users to run scripts that are actively marked as `RUN`.

The key components of this script include:

- **script_identifier.xsh**: This is a user-created script that generates a list of scripts. The `-c` flag specifies a filter that returns only those scripts which are active and have the `RUN` type.
- **Rofi Dmenu**: This enhanced launcher allows for more customization and improved usability when selecting scripts to run.

The output of `script_identifier.xsh` is formatted in a way that it shows both the script filename and a brief description, making it easy for the user to select an appropriate script.

---

<a name="usage" />

#### Usage

To use the `dmenu_run_scripts.xsh` script, follow these steps:

1. Ensure all dependencies are installed.
2. Open a terminal emulator.
3. Execute the script by running:
   ```bash
   xonsh /home/matias/.scripts/dmenu_run_scripts.xsh
   ```
4. A dmenu or rofi window will open, displaying the available scripts. Choose one from the list to execute it.

You can also bind this script to a keyboard shortcut for quick access.

<a name="examples" />

#### Examples

To run a specific script named `example_script.xsh`, execute the following:
```bash
xonsh /home/matias/.scripts/dmenu_run_scripts.xsh
```
Then, select `example_script.xsh` from the list presented by rofi.

---

<a name="notes" />

### Notes

- The script currently relies on the output from `script_identifier.xsh`. If that script encounters issues or does not return active scripts, this script will not function correctly.
- Check for any completion or syntax errors in the scripts listed, as rofi may not show them if they can't be executed.

> **Critique**: 
> The script assumes that there are always active scripts available to execute. It could benefit from added error handling to alert the user if no scripts are found or if `script_identifier.xsh` fails to run. Additionally, providing a fallback option or a better message in such scenarios would improve the user experience. Further, ensuring compatibility with both `dmenu` and `rofi` could be explored, and perhaps allowing users to choose their preferred launcher could enhance versatility.