# select_script

**Script Overview**

This is a C program that uses the Rofi (Run or Find and Execute Input Line) utility to select and execute a script from a cached list. The script reads data from a CSV file named "script_info.csv" in the user's home directory, displays the available scripts using Rofi, extracts the chosen script name, and executes it.

**Functionality**

1. **Load Cache**: The program loads the cached data from the "script_info.csv" file into memory.
2. **Display Rofi Menu**: The loaded data is used to display a menu of available scripts in Rofi.
3. **Extract Choice**: The user selects a script from the menu, and the chosen script name is extracted.
4. **Free Cache**: After extracting the choice, the cached data is freed to release memory.
5. **Execute Script**: Finally, the program executes the selected script by running its executable.

**Assumptions**

* This script assumes that the "script_info.csv" file exists in the user's home directory and contains valid CSV data with two columns: "file" and "descr".
* The script also assumes that the Rofi utility is installed on the system.
* The script does not perform any error checking or validation on the input data.

**Security Considerations**

* This script executes a command based on user input, which can pose security risks if not properly sanitized. In this case, however, the script name is extracted and executed directly without further processing.
* Additionally, the script uses `popen` to execute commands in a new shell process, which can also introduce security risks if not used carefully.

Overall, this script demonstrates how to use Rofi to select and execute a script from a cached list. However, it's essential to consider security implications when using similar scripts in production environments.