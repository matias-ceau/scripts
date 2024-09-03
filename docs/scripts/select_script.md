# Script Selector with Rofi

---

**select_script**: A C script that selects a chosen script using cached data from a CSV file.

---

### Dependencies

- `rofi`: A dynamic window switcher, application launcher, and dmenu replacement. This script uses it to display selectable script options.

### Description

This C script enables users to select and execute a script from a predetermined list stored in a cached CSV file. The cache file contains information about scripts, including their file names and descriptions. The scripts are displayed in a visually appealing manner using `rofi`, allowing users to choose from a list of available scripts easily. 

The main components of the script include:

- **Loading Cache:** The function `load_cache` reads the CSV file containing script information, skipping the header, and stores it in an array of `ScriptInfo` structs.
- **Displaying Choices:** The `display_rofi` function presents the list of scripts formatted with `rofi`. Each script shows the file name in green followed by its description.
- **User Selection:** The `extract_choice` function reads the user's choice from `rofi`, allowing them to select their desired script from the displayed options.
- **Executing Scripts:** Finally, the `execute_choice` function constructs the appropriate file path and utilizes `execl` to run the selected script.

### Usage

To utilize this script, make sure you have the cache file in place and run the script as follows:

```
./select_script
```

Ensure that your environment variable `HOME` is correctly set, as this script builds paths based on it. The script will automatically read from `~/.cache/script_info.csv` to obtain script details and from `~/.scripts/` to locate the scripts themselves.

---

> [!TIP] 
> The script currently does not handle potential errors related to script execution robustly. To improve this, consider adding checks to verify if the script file exists before calling `execl`, and handle cases where the user cancels the selection in `rofi`. Additionally, the script may benefit from a more structured logging mechanism to help diagnose potential issues during runtime.