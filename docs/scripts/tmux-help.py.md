# Tmux Help (tmux-help.py)

---

A script to assist with tmux commands and manpage management.

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
- `fuzzywuzzy` library (for fuzzy string matching)
- `tmux` (as the target command utility)

<a name="description" />

### Description

<a name="overview" />

#### Overview

`tmux-help.py` is designed to help users easily access and manage tmux commands through searching and categorization. It loads the tmux manpage and section details, allowing users to quickly search for commands by keywords, list available commands, or display specific sections from the manpage. The script performs regular updates to keep the command list and sections current.

Key functionalities include:
- Ensuring necessary directories and files exist.
- Loading tmux commands from local files.
- Logging errors and information for debugging.
- Searching commands using fuzzy and exact matching techniques.
- Categorization of commands into themes for better organization.
- Easier access to sections of the tmux manpage.

---

<a name="usage" />

#### Usage

Run the script from the terminal. The script accepts the following command-line arguments:

- `-L`, `--list-tmux`: List all tmux commands in the original order.
- `-f`, `--find ARG`: Fuzzy search for commands containing the provided ARG.
- `-F`, `--find-exact ARG`: Search for an exact match of ARG (case insensitive).
- `-s`, `--search KEY`: Search commands with the specified key and return results.
- `-u`, `--update`: Update the tmux manpage and sections.
- `-S`, `--section [SECTION]`: List all sections or display a specific section by number or name.

To run, make sure the necessary data files are populated and execute as follows:
```bash
python3 /home/matias/.scripts/dev/tmux-help.py [options]
```

<a name="examples" />

#### Examples

- List all available tmux commands in original order:
    ```bash
    python3 /home/matias/.scripts/dev/tmux-help.py -L
    ```

- Fuzzy search for commands containing 'split':
    ```bash
    python3 /home/matias/.scripts/dev/tmux-help.py -f split
    ```

- Exact search for a specific command:
    ```bash
    python3 /home/matias/.scripts/dev/tmux-help.py -F 'new-window'
    ```

- Update the tmux manpage and sections if outdated:
    ```bash
    python3 /home/matias/.scripts/dev/tmux-help.py -u
    ```

- List all sections of the tmux manpage:
    ```bash
    python3 /home/matias/.scripts/dev/tmux-help.py -S
    ```

---

<a name="notes" />

### Notes

- The script requires populated files for tmux commands and sections. Ensure to run the update command if these files are missing.
- The `fuzzywuzzy` library needs to be installed. You can do this via pip:
  ```bash
  pip install fuzzywuzzy
  ```

> **Critique**: 
> While the script is quite comprehensive, the exception handling around file operations could be improved for clarity, and adding more detailed logging could assist in debugging. Additionally, it would benefit from a more modular design, separating concerns into different functions or classes for better readability and maintainability.