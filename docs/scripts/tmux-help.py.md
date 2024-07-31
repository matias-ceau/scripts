# Tmux Help Script

---

**[tmux-help.py](/tmux-help.py)**: tmux-help.py - A script providing helpful utilities and search capabilities for tmux commands.

---

### Dependencies

- `argparse`: Used for creating command-line interfaces in Python.
- `configparser`: Allows reading and writing configuration files.
- `os`: Provides a way of using operating system functionalities like file and directory manipulation.
- `re`: Enables regular expression operations for searching and manipulating strings.
- `sys`: Provides access to command-line arguments.
- `subprocess`: Used to execute other commands or scripts directly from Python.
- `time`: Allows handling of time-related functions.
- `fuzzywuzzy`: Utilizes fuzzy string matching for searching tmux commands.

### Description

The `tmux-help.py` script is a comprehensive tool designed to assist users in navigating and utilizing tmux commands effectively. It does so by providing the ability to:

- Load and manage a local copy of the tmux manual page.
- Search for commands based on fuzzy matching or exact string matching.
- List available tmux commands categorized in a user-friendly format.
- Update the local manpage and section logs from the latest tmux manual.

This script handles the creation of necessary configuration directories and files if they do not already exist. The key functionalities include:

- **Listing Commands**: Commands can be listed in their original order or categorized for easier navigation.
- **Searching**: Users can search for specific commands using keywords or key bindings.
- **Updating Manpages**: Users can periodically update their local tmux manual to reflect any changes.

### Usage

To use the script, ensure it is executable and run from a terminal. Here are the command options available:

```bash
./tmux-help.py -L
```
List tmux commands in the original order.

```bash
./tmux-help.py -f keyword
```
Fuzzy search for commands containing 'keyword'.

```bash
./tmux-help.py -F keyword
```
Search for commands that exactly match 'keyword' (case insensitive).

```bash
./tmux-help.py -s key
```
Search for commands associated with the specified key.

```bash
./tmux-help.py -u
```
Update local tmux manpage and sections.

```bash
./tmux-help.py -S
```
List all sections of tmux commands or specify a section by its name or number.

---

> [!TIP]  
> The script could benefit from enhanced error handling in `load_tmux_commands()` to provide more specific feedback on the issues encountered while loading files. Additionally, implementing a caching mechanism for loaded commands could improve performance, especially when repeatedly accessing command help.
