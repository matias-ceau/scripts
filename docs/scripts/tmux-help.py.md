# Tmux Help Script

---

**tmux-help.py**: A script providing helpful guidance on tmux commands.

---

### Dependencies

- `argparse`: Used for handling command-line arguments.
- `configparser`: Used for managing configuration files (not actively used but might be useful in the future).
- `fuzzywuzzy`: A library for string matching, required for fuzzy searching functionality.
- `subprocess`: Utilized to run shell commands.
- `os`, `re`, `sys`, `time`: Standard Python libraries for file handling, regular expression operations, system operations, and time management.

### Description

This script is designed to assist users of the terminal multiplexer `tmux` by providing an easy way to list, search, and manage commands. The script performs several functions:

- **Ensure Paths**: It checks for and creates necessary directories and files where tmux manpage data will be stored.
- **Command Listing**: It lists tmux commands in categorized themes such as Navigation, Editing, File Management, System Control, and Application Launching.
- **Searching Functionality**: It allows fuzzy and exact searching for commands, as well as searching based on key bindings.
- **Updating Manpage**: The script can fetch the latest tmux manpage and sections from the command line using the `man` command, updating stored files.

The management of theme-based command lists and sections aids in efficiently navigating tmux commands, promoting a better user experience.

### Usage

The script runs in the command line with several options available for user interaction. Here's a quick guide on how to use it:

```bash
python3 /path/to/tmux-help.py [OPTIONS]
```

#### Options

- `-L`, `--list-tmux`: List tmux commands in their original order.
  
```bash
python3 /path/to/tmux-help.py --list-tmux
```

- `-f`, `--find ARG`: Perform a fuzzy search for commands related to the provided keyword.
  
```bash
python3 /path/to/tmux-help.py --find split
```

- `-F`, `--find-exact ARG`: Search for an exact match (case insensitive).
  
```bash
python3 /path/to/tmux-help.py --find-exact new-window
```

- `-s`, `--search KEY`: Search for commands related to the specified key.
  
```bash
python3 /path/to/tmux-help.py --search C-b
```

- `-u`, `--update`: Update the tmux manpage and sections, fetching the latest content.

```bash
python3 /path/to/tmux-help.py --update
```

- `-S`, `--section [SECTION]`: List all sections or display a specific section by its number or name.

```bash
python3 /path/to/tmux-help.py --section 2
```

---

> [!TIP] 
> While the script is functional, there are areas for improvement. For instance:
> - **Error Handling**: Some functions, especially file operations, could be enhanced with better error handling to make the script more robust.
> - **Code Optimization**: The command listing functions may benefit from further optimization to prevent redundancy.
> - **Documentation**: Additional inline comments and function docstrings would improve maintainability and clarity of the code for future modifications.