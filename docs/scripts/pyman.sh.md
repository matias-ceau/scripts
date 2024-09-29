# Pyman: Python Package Management Interface

---

**pyman.sh**: A bash script for managing and exploring Python packages with enhanced interactivity.

---

### Dependencies

- `python`: Required for retrieving version and documentation of Python packages.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `bat`: A cat clone with syntax highlighting and Git integration, enhancing the output style.
- `fzf`: A command-line fuzzy finder, which provides interactive command-line feature.
- `notify-send`: Utility to create desktop notifications.

### Description

Pyman is a command-line utility designed to streamline the process of managing and exploring Python packages in an interactive way. It provides an interface leveraging `fzf` to browse through topics, keywords, built-ins, and modules. 

The script begins by setting environment variables based on the current Python version and its site packages directory. These variables include:

- `VERS`: Stores the Python version.
- `SEARCH_PATH`: The directory where Python libraries are located.
- `PYMAN_CACHE_DIR`: A cache directory for current session files.

Several functions are defined to extract information about Python packages. 

- **get_topics**: Fetches and formats available doc topics.
- **get_keywords**: Retrieves keywords from the documentation, styled by `bat`.
- **get_site_packages**: Lists site packages, differentiating Python files from directories.
- **get_submodules**: Investigates submodules of a specified package.
- **get_builtins**: Displays built-in Python functions and variables.
- **bat_preview**: Prepares documentation for preview.
- **enter_cmd**: Executes commands based on user choices, such as opening files in `ranger` or displaying content with `bat`.

The utility will pipe results into `fzf`, allowing users to interactively select their desired option.

### Usage

To run the script, execute it in your terminal:

```bash
bash /home/matias/.scripts/pyman.sh
```

Users can navigate through different categories (Topics, Keywords, etc.) using the following key bindings:

- `Alt + l`: List available site packages
- `Alt + b`: Show built-in functions
- `Alt + k`: Display keywords from documentation
- `Alt + t`: View documentation topics
- Select an item and hit `Enter` to execute it

If executed within a QTile keybinding, simply bind it to your shortcut of choice in your configuration file.

---

> [!TIP] 
This script could be improved by adding error handling, such as checking if required commands (`python`, `fd`, `bat`, `fzf`, `notify-send`) are installed. Additionally, consider providing inline help for users who may not be familiar with the commands used.