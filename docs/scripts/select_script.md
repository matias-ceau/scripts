# Script Selector with Cache Integration

---

**select_script**: A tool to select and execute scripts from a cached list using `rofi`.

---

### Dependencies

- `rofi`: A window switcher, run dialog, and dmenu replacement that helps in selecting scripts from a list.
- `glibc`: Required for standard C library functions such as `printf` and `fopen`.

### Description

This script is designed to streamline the process of selecting and executing scripts from cached data. It uses a cache file located at `~/.cache/script_info.csv`, which holds information about various scripts, including filenames and descriptions.

The script works in tandem with the `rofi` tool, which provides a user-friendly interface for script selection. By using the `rofi` dmenu, users can choose a script to run from a list, where each entry is displayed with a green-colored filename followed by its description.

Key functions implemented in the script include:

- **load_cache**: Reads the cache file, parses each line, and stores script information in a dynamic array.
- **display_rofi**: Formats and sends the script list to `rofi` to be displayed.
- **extract_choice**: Retrieves the user's selection from `rofi`.
- **execute_choice**: Launches the selected script.

### Usage

To use this script, ensure you have the cache file (`~/.cache/script_info.csv`) available and filled with appropriate script data. Then, by executing the `select_script`, `rofi` will present the list to choose from:

```shell
~/path/to/select_script
```

A typical cache file entry is in CSV format like:
```
example_script,description,other,fields,are,ignored,"This is just a test script"
```

Ensure the script files are located in `~/.scripts/`.

---

> [!TIP]
> This script assumes that `HOME` is set and directly uses paths relative to the user’s home directory. If using on a shared system or with a different home setup, be cautious of path assumptions. Additionally, error handling could be improved by checking if the script file exists before attempting to execute it. Consider using functions like `access` to validate file existence and permissions before execution.