# Tmux Help Guide

---

**tmux-help.py**: A script to search and display helpful information from the tmux manpage.

---

### Dependencies

- `python3`: The script is written in Python and requires Python 3 for execution.
- `argparse`: Used for parsing command-line arguments.
- `configparser`: Used for managing configurations.
- `os`, `sys`, `subprocess`, `time`, `re`: Standard Python libraries for various functions.
- `fuzzywuzzy`: Used for performing fuzzy searches.
- `tmux`: Ensure tmux is installed, as this script depends on its manpage.

### Description

The `tmux-help.py` script is designed to assist users by extracting and displaying specific sections or commands from the tmux manpage. It organizes the tmux command output into categorized sections for better readability. The script features multiple functionalities such as fuzzy searching, exact keyword searching, section listing, and manpage updates.

Files are used to store the full tmux manpage, section data, logs, and update status in a persistent manner. The script can automatically check for updates to the manpage every week or can be manually updated by the user.

Key features include:
- Highlighted tmux keybindings for better visual representation.
- Fetches the latest tmux documentation directly from the manpage using subprocess calls.
- Logs errors and information to a log file located in the specified data directory.

### Usage

This script can be executed from the command line with the following options:

```bash
python3 /home/matias/.scripts/dev/tmux-help.py [OPTIONS]
```

- `-L`, `--list-tmux`: Lists tmux commands in their original order.
- `-f`, `--find ARG`: Performs a fuzzy search for keywords in tmux descriptions.
- `-F`, `--find-exact ARG`: Searches for an exact match (case-insensitive).
- `-s`, `--search KEY`: Searches for commands matching the specified key.
- `-u`, `--update`: Updates the tmux manpage and sections.
- `-S`, `--section`: Lists all sections or displays a specified section by its number or name.

**Examples:**

1. To list all tmux commands:
   ```bash
   python3 /home/matias/.scripts/dev/tmux-help.py --list-tmux
   ```

2. To perform a fuzzy search for 'detach':
   ```bash
   python3 /home/matias/.scripts/dev/tmux-help.py --find "detach"
   ```

3. To update the tmux help data:
   ```bash
   python3 /home/matias/.scripts/dev/tmux-help.py --update
   ```

---

> [!TIP]
> Consider improving error handling for the section extraction process. Ensure you define the `extract_keybindings` function properly to avoid potential confusion for future maintenance. Additionally, check that data files are correctly populated as this script heavily relies on them for accurate outputs.