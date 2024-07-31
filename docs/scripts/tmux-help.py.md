# Tmux Help Script (tmux-help.py)

---

A script to assist with tmux command lookup and management.

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
- fuzzywuzzy
- tmux (for manpage access)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `tmux-help.py` script is designed to offer a simple command-line interface for retrieving and managing tmux commands. It leverages the tmux manpage to extract command descriptions, allowing users to quickly search, categorize, and learn about available tmux functionalities.

Key functionalities include:
- **Command Listing**: It can list all tmux commands, either in their original order or categorized by function (Navigation, Editing, File Management, etc.).
- **Searching**: Users can perform both fuzzy and exact searches on tmux commands and find commands associated with specific key bindings.
- **Section Management**: It maintains sections of the manpage which can be listed or displayed individually.
- **Updating**: The script can update the tmux manpage and section files automatically.

This tool is particularly useful for frequent tmux users who need quick access to command information.

---

<a name="usage" />

#### Usage

To use the script, simply run it from the command line. Below are the available options:

```
$ python3 tmux-help.py [OPTIONS]
```

Options:
- `-L`, `--list-tmux`: List all tmux commands in the original order.
- `-f`, `--find ARG`: Fuzzy search for keywords in command descriptions.
- `-F`, `--find-exact ARG`: Perform a case-insensitive exact search for a command.
- `-s`, `--search KEY`: Search for commands associated with the specified key.
- `-u`, `--update`: Update the tmux manpage and section files.
- `-S`, `--section [SECTION]`: List all sections or display a specific section by number or name.

This script can be executed directly as needed, or set up in a keybinding for easy access in your window manager.

<a name="examples" />

#### Examples

1. List all tmux commands:
   ```
   $ python3 tmux-help.py -L
   ```

2. Fuzzy search for commands related to "pane":
   ```
   $ python3 tmux-help.py -f pane
   ```

3. Exact search for a command:
   ```
   $ python3 tmux-help.py -F split-window
   ```

4. Display commands associated with a specific key:
   ```
   $ python3 tmux-help.py -s C-b
   ```

5. Update the manpage and sections:
   ```
   $ python3 tmux-help.py -u
   ```

6. List all sections:
   ```
   $ python3 tmux-help.py -S
   ```

---

<a name="notes" />

### Notes

- Ensure that the necessary directory structure (`~/.scripts/config/tmux-help/data`) exists or that the script can create it.
- The script uses `fuzzywuzzy` for performing fuzzy searches, so install it using `pip install fuzzywuzzy`.
- The script may require tmux to be installed to fetch the manpage.

> **Critique**: 
> - The script could improve its error handling to avoid unexpected crashes; for example, gracefully handling scenarios where the 'man' command fails due to tmux not being installed. 
> - Consider modularizing certain functions further for better readability and maintainability.
> - Documentation could include additional examples or a detailed explanation of the expected content for `_full-manpage.txt` and `_sections.txt` to help users populate these files appropriately.