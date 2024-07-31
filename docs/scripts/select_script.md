# Script Selection Utility

---

**[select_script](select_script.c)**: A C script for selecting and executing a script from a cached list.

---

### Dependencies

- `rofi`: A popular application launcher and dmenu replacement. This script uses `rofi` to display a selectable list of scripts, leveraging its markup capabilities for better presentation.

### Description

This script provides a command-line utility for selecting and executing scripts from a predefined list stored in a CSV cache file. It is developed in C and relies on standard I/O and string manipulation functions, as well as system calls to execute chosen scripts. The script performs the following tasks:

1. **Load Cached Scripts**: Reads a cache file located in the user's home directory, specifically in the `.cache` folder. It extracts the filename and description of each script.
2. **Display Options**: Utilizes `rofi` to present the list of scripts in a visually appealing way. Each entry is formatted with green text, indicating the script’s filename and its description.
3. **Extract User Choice**: Captures the user's selection from `rofi` and prepares to execute the corresponding script.
4. **Execute Selected Script**: Uses `execl` to run the selected script, passing the necessary parameters.

### Usage

To use the script, simply run it in a terminal. Ensure you have a populated cache file (`script_info.csv`) in your `.cache` directory containing the script details. The basic command is as follows:

```bash
/home/matias/.scripts/bin/select_script
```

The cache file should have entries formatted as follows:

```
filename,other_info,...
script_name,"description"
```

Upon execution, the script will present a `rofi` menu, allowing you to select a script. Once chosen, the respective script will be executed.

---

> [!TIP] 
> The script does not handle the situation where the user cancels the `rofi` selection, which may lead to an attempt to execute an empty script name. Adding a check after extracting the choice to ensure it is not empty would improve user experience. Additionally, consider implementing error handling for `execl`, as failure to start the script should be appropriately reported.
