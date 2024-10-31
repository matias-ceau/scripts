# Select Script - Script Selector Using Rofi

---

**select_script**: C script that selects a chosen script using cached data.

---

### Dependencies

- `rofi`: A window switcher, application launcher, and dmenu replacement that is used for displaying the list of scripts.

### Description

The **select_script** utility is a C program designed to assist users in selecting and executing scripts from a predefined folder. It uses cached data from a CSV file to present available script options through the **rofi** interface. The program is structured around several core functions for loading cache data, displaying script options, and executing the chosen script.

Key functions include:

- **load_cache**: Reads the cache file `script_info.csv` and loads script information into memory.
- **display_rofi**: Outputs the available scripts formatted with `rofi` for user selection.
- **extract_choice**: Captures the user's selected script and prepares it for execution.
- **execute_choice**: Executes the selected script using `execl`.

### Usage

To execute the script, simply run it in your terminal. Make sure that your environment is set up correctly and that the cache file exists.

```bash
./select_script
```

**Note**: The cache file is expected to be located at `~/.cache/script_info.csv`, and the scripts should be available in the `~/.scripts/` directory.

---

> [!TIP]  
> This script currently does not handle cases where the user cancels the selection in rofi. Implementing an error check after extracting the user's choice could prevent the program from trying to execute an empty value. Additionally, consider adding more error handling for file operations to make the script more robust.