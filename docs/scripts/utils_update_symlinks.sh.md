# Symlink Utility Script (utils_update_symlinks.sh)

---

Creates and manages symlinks in ~/.local/bin, logging activity.

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

- Bash
- `fd` (a fast and user-friendly alternative to `find`)
- `bat` (a cat alternative with syntax highlighting)
- Access to the environment variable `$SCRIPTS` (needs to be set to the source directory)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script automates the management of symbolic links in the user's `~/.local/bin` directory. It performs the following functions:

1. Initializes a CSV log for symlink creation and maintenance, backing up any previous logs.
2. Cleans up broken symlinks in the target directory.
3. Creates symlinks for scripts located in the specified source directory (`$SCRIPTS`), avoiding conflicts with existing symlinks.
4. Logs created symlinks to a CSV file and outputs the contents in a user-friendly format.

Logging is done through color-coded messages in the terminal as well as by appending logs into a specified log file.

---

<a name="usage" />

#### Usage

To run the script, execute it from the terminal. Ensure that the `$SCRIPTS` environment variable is set to the directory containing the scripts you want to link. The script does not require user input during execution:

```bash
bash /home/matias/.scripts/sys/utils_update_symlinks.sh
```

Additionally, it can be assigned to a keybinding in Qtile for quicker access.

<a name="examples" />

#### Examples

- Run the script to create or update symlinks:
  ```bash
  bash /home/matias/.scripts/sys/utils_update_symlinks.sh
  ```

- After running, view the CSV log:
  ```bash
  cat ~/.local/bin/log/symlinking.log
  ```

---

<a name="notes" />

### Notes

- It is advisable to run the script periodically to keep the symlinks updated and remove any broken ones.
- Ensure that all scripts in the `$SCRIPTS` directory are intended for symlinking to avoid unwanted overwrites.
- The script outputs messages using colors for better readability.

> **Critique**: 
> - The script currently assumes the directory structure without verifying their existence. Adding checks at the start could enhance robustness.
> - The `sleep` commands might not be necessary; consider removing them unless intended for pacing the logging output.
> - Error handling could be improved by checking if the necessary commands (`fd`, `bat`, `echo`) exist before running the script.