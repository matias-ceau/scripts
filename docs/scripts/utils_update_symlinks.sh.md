# utils_update_symlinks.sh

---

A script to create symlinks in ~/.local/bin and remove old ones.

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

- bash
- fd (a simple file finder)
- bat (a cat clone with syntax highlighting and Git integration)
- glow (a terminal-based Markdown renderer)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `utils_update_symlinks.sh` script facilitates the management of symlinks in the `~/.local/bin` directory. It ensures that all executable scripts located in a specified source directory (defined by the `$SCRIPTS` environment variable) are symlinked properly. The script also removes any broken symlinks, avoiding clutter and potential execution errors. 

Key functionalities include:
- Logging successful operations and errors to a specified log file.
- Automatic creation of symlinks for new scripts while checking for conflicts.
- Maintenance of a CSV file that lists all active symlinks and their original paths, providing an easy reference for users.

---

<a name="usage" />

#### Usage

1. Set the environment variable `SCRIPTS` to the directory containing the scripts you want to symlink.
2. Run the script in the terminal:

   ```bash
   bash /home/matias/.scripts/sys/utils_update_symlinks.sh
   ```

3. Optionally, you may add this script to your qtile configuration as a keybinding, allowing for convenient executions.

<a name="examples" />

#### Examples

- To create symlinks for all executable files located in `$SCRIPTS`:

   ```bash
   SCRIPTS=/path/to/your/scripts bash /home/matias/.scripts/sys/utils_update_symlinks.sh
   ```

- Upon successful execution, the output may show:

   ```
   # Cleaning...
   Cleaning complete!
   # Symlinking...
   Symlinking complete!
   # Adding symlinks to CSV...
   CSV update complete!
   ```

---

<a name="notes" />

### Notes

- Ensure that the target directory `$HOME/.local/bin` is included in your PATH variable for the symlinks to be executable from anywhere in the terminal.

- Check the log file located at `$SCRIPTS/log/symlinking.log` for details on operations performed by the script.

> **Critique:** While the script effectively handles symlink creation and cleanup, it could benefit from:
> - Adding command-line arguments for flexibility, such as specifying the source or target directories.
> - Improving error handling by checking for missing dependencies at the start.
> - Consider using an array for logging messages to concatenate multiple entries before output, reducing IO operations.