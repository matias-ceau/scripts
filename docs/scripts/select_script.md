# Script Selection Utility

---

**select_script**: C program for selecting and executing scripts based on cached information.

---

### Dependencies

- `rofi`: A window switcher, application launcher, and dmenu replacement. Required for displaying script options.

### Description

This script is a C program that helps users select and execute scripts from a predefined set of scripts stored in CSV format in a cache file. The program uses the `rofi` application to display a visually appealing menu for the user to pick a script.

The core functionality of the script is outlined as follows:

1. **Cache file handling**: The program loads script information (including file names and descriptions) from a cache file located in the user's `.cache` directory. The cache file is expected to be in CSV format with the first line as a header.
   
2. **Memory Management**: It utilizes dynamic memory allocation to accommodate varying numbers of scripts. Memory is allocated for each script loaded from the cache.

3. **Rofi Interface**: The user interface is handled using `rofi`, which presents the list of available scripts to the user in a menu-like format.

4. **Execution of Selected Script**: Once the user makes a selection, the program attempts to execute the chosen script from the specified scripts directory.

### Usage

To utilize the `select_script`, follow these steps:

1. Ensure that `rofi` is installed on your system.
2. Create a CSV file in the `~/.cache/script_info.csv` directory with the following structure:
   ```
   file,property1,property2,...,description
   script1.sh,,,,"This is script 1"
   script2.sh,,,,"This is script 2"
   ```

3. Compile the script:
   ```bash
   gcc -o select_script /home/matias/.scripts/bin/select_script.c
   ```

4. Execute the script:
   ```bash
   ~/path/to/select_script
   ```

5. A `rofi` menu will appear, displaying the available scripts. Select one and press Enter to execute it.

---

> [!TIP]  
> Consider adding more robust error handling, particularly when dealing with the CSV parsing to prevent crashes from improperly formatted data. Additionally, you might want to implement logging capabilities or add user feedback for no available scripts.