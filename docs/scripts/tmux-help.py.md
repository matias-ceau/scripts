# Tmux Help Script

---

**tmux-help.py**: Interactive script to assist with tmux commands and manage usage information.

---

### Dependencies

- `argparse`: For parsing command-line arguments.
- `configparser`: To handle configuration files (not actively used in code).
- `os`: Provides a way to use operating system-dependent functionality.
- `re`: For regular expressions, useful for command parsing.
- `sys`: Provides access to system-specific parameters and functions.
- `subprocess`: To run shell commands from within Python.
- `time`: For time-related functions.
- `fuzzywuzzy`: Enables fuzzy string matching.

### Description

The `tmux-help.py` script is designed to help users easily access tmux commands and relevant sections of the tmux manpage. The script performs several key functions including:

- **Path Management**: It ensures necessary directory structures and files are in place for storing tmux data.
- **Loading Commands**: Loads tmux commands from a manpage into memory for interaction.
- **Command Searching**: Implements fuzzy and exact searches to filter tmux commands based on user input.
- **Sections Handling**: Lists and displays specific sections from the tmux manpage, allowing for a focused view of commands based on categories.

The script is robust with built-in logging for tracking errors and information, ensuring users can debug easily.

### Usage

To use this script, run it with Python 3 and provide command-line arguments as required. Here are some common examples:

- List all tmux commands:
  ```bash
  python3 tmux-help.py
  ```
  
- List tmux commands in their original order:
  ```bash
  python3 tmux-help.py --list-tmux
  ```
  
- Fuzzy search for commands containing a keyword:
  ```bash
  python3 tmux-help.py --find <keyword>
  ```
  
- Exact search for commands:
  ```bash
  python3 tmux-help.py --find-exact <keyword>
  ```

- Search for commands associated with a specific key:
  ```bash
  python3 tmux-help.py --search <key>
  ```
  
- List all sections or display a specific section by number/name:
  ```bash
  python3 tmux-help.py --section
  python3 tmux-help.py --section <section_number_or_name>
  ```

- Update the tmux manpage:
  ```bash
  python3 tmux-help.py --update
  ```

---

> [!TIP] 
> The script currently logs errors and info but could benefit from a more comprehensive error handling strategy. For example, implementing retries for failed subprocess commands could enhance its robustness. Furthermore, consider cleaning up or managing the generated files more effectively to prevent clutter over time.