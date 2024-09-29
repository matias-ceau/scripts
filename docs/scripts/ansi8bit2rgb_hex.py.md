# ANSI 8-Bit to RGB/HEX Converter

---

**ansi8bit2rgb_hex.py**: A script to convert 8-bit ANSI color codes to RGB or HEX formats.

---

### Dependencies

- `python`: The core dependency for running this script.

### Description

This Python script facilitates the conversion of 8-bit ANSI color codes into their equivalent RGB or HEX representations. It handles the full range of ANSI colors defined from 0 to 255, including both standard and extended colors. The script features several functions:

- **ansi_to_rgb(color)**: Converts a single ANSI color code to an RGB tuple. Supports color codes in three ranges:
  - 0-15 for standard colors (basic color palette).
  - 16-231 for colors based on a formula that calculates RGB values.
  - 232-255 for grayscale colors.

- **format_color(rgb, color_format)**: Formats the RGB values into the desired output string format—either 'hex' for hexadecimal representation or 'rgb' for the RGB format.

- **print_colors(colors, color_format, colorize, print_names)**: Prints out the converted colors based on input options, applying any desired formatting and colorization.

- **usage()**: Outputs the usage instructions for the script, detailing supported commands, options, and examples.

The script runs from the command line and processes input arguments to determine which colors to convert.

### Usage

To utilize this script, execute it from the command line with the desired parameters. Here are the available commands and options:

```bash
# General usage pattern
python ansi8bit2rgb_hex.py <command> [options] <number>|<range>|<list>

# Required commands
rgb   --- outputs color in RGB format
hex   --- outputs color in HEX format
help  --- shows this message

# Example executions
python ansi8bit2rgb_hex.py rgb 242       # outputs: rgb(108,108,108)
python ansi8bit2rgb_hex.py rgb -n 242    # outputs: color242    rgb(108,108,108)
python ansi8bit2rgb_hex.py hex 242       # outputs: #6c6c6c
python ansi8bit2rgb_hex.py rgb           # outputs all 256 colors
python ansi8bit2rgb_hex.py rgb 35-167    # outputs colors from 35 to 167
python ansi8bit2rgb_hex.py rgb 35,167    # outputs colors 35 and 167
```

Optional flags:
- `--name, -n` : Include color name in the output.
- `--colorize, -c` : Colorize the output based on ANSI codes.

---

> [!TIP] 
The script is robust, but consider adding error handling for invalid input ranges and improving functionality by allowing input from files or environment variables. Additionally, it might be useful to support further color formats, such as HSL or CMYK, enhancing its versatility for users needing diverse color representations.