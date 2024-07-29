# colormap_from_text.sh

**Script Description**

This is a Bash script designed to extract color palettes from config files. The script takes options to customize the output format, which can be either hex code, RGB values, or both.

**Functionality**

Here's a step-by-step breakdown of the script's functionality:

1. **Option Handling**: The script uses a `while` loop to iterate through the command-line arguments. It checks for specific options:
	* `-x|--hex-code`: Enables hex output.
	* `-r|--rgb`: Enables RGB output.
	* `-c|--color`: Enables color output (using ANSI escape codes).
2. **Error Handling**: If both `-x` and `-r` options are specified, the script prints an error message and exits.
3. **Color Extraction**: The script uses `grep` to extract hex color codes from a file (not provided in the script). It sorts the extracted colors uniquely using `sort -u`.
4. **Color Conversion**: For each extracted color, the script converts it from hex code to RGB values using `printf`. It then outputs the color in the specified format:
	* If `-x|--hex-code` is enabled, output the hex code.
	* If `-r|--rgb` is enabled, output the RGB values.
	* If neither is enabled, output a plain text representation of the RGB values (e.g., `255, 0, 0`).
5. **Color Output**: If `-c|--color` is enabled, the script outputs the color in ANSI escape code format, along with a placeholder string (`       `) to demonstrate the color.

**Assumptions and Limitations**

This script assumes that:

* The input file contains hex color codes.
* The script has access to the input file (not provided).
* The script is executed from a Unix-like environment (due to the use of `grep` and ANSI escape codes).

The script does not handle cases where the input file is empty or does not contain any valid hex color codes.