# Script Selector with Cache

---

**select_script**: Utility to select and execute scripts from cached data using `rofi`

---

### Dependencies

- `rofi`: This script utilizes `rofi` as a dmenu replacement for script selection.

### Description

The `select_script` utility is designed to help users select and execute scripts from a pre-cached list. It relies on a cache file located at `~/.cache/script_info.csv`, which contains details about available scripts including filenames and descriptions. 

The script performs the following steps:

1. **Load Cache**: Reads `~/.cache/script_info.csv` to load available scripts and their descriptions into memory.
2. **User Interface**: Uses `rofi`, a window switcher application, to present the list of scripts in a user-friendly way. Each script is displayed with its description.
3. **User Selection**: Users select their desired script through `rofi`. 
4. **Execution**: The chosen script is executed from `~/.scripts/`.

This script is particularly useful in environments where managing and executing a variety of scripts is frequent, providing a streamlined interface for managing these tasks.

### Usage

Ensure the cache (`~/.cache/script_info.csv`) is correctly populated with scripts data. The format typically involves commna-separated values representing script metadata.

To execute the script:

```bash
./select_script
```

You can assign this script to a custom keybinding in your qtile configuration to quickly invoke the script selector when needed. 

Example of running the script manually:

```
$ /home/matias/.scripts/bin/select_script
```

---

> [!NOTE] The script assumes the cache file `~/.cache/script_info.csv` is always available and contains valid data. Error handling for missing or malformed cache files could be improved. Additionally, executing scripts might fail if they are not marked as executable or if their paths are incorrect, so verifying script permissions and paths could be a useful enhancement.