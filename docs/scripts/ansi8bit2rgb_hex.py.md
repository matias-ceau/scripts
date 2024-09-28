# ANSI to RGB/HEX Converter

---

**ansi8bit2rgb_hex.py**: Converts 8-bit ANSI color codes to RGB or HEX format.

---

### Dependencies

- `python`: The script is written in Python and requires a Python interpreter.
- `os` and `sys`: These are standard Python libraries used for interacting with the operating system and command-line arguments.

### Description

This script converts 8-bit ANSI color codes to RGB or HEX formats. It supports standard colors, high intensity colors, and grayscale colors within the ANSI color range 0 to 255. The conversion is done by mapping colors to RGB tuples based on their position in the ANSI standard, with specific handling for the standard 0-15 color codes, 16-231 color range that map to RGB cubes, and 232-255 grayscale range.

- **ansi_to_rgb(color)**: Converts an ANSI color code to an RGB tuple.
- **format_color(rgb, color_format)**: Formats the RGB tuple into either a `rgb(r, g, b)` or `#rrggbb` hex string based on the requested format.
- **print_colors(colors, color_format, colorize, print_names)**: Prints the list of color conversions with options for colorized and named output.

### Usage

Run the script with commands and options to convert color codes:

```bash
./ansi8bit2rgb_hex.py <command> [options] <number>|<range>|<list>
```

- **Commands**:
  - `rgb`: Outputs the 8-bit color as `rgb(r, g, b)`.
  - `hex`: Outputs the color in `#rrggbb` hex format.
  - `help`: Displays usage information.

- **Options**:
  - `-n`, `--name`: Prints the color name followed by its value.
  - `-c`, `--colorize`: Colorizes the output for terminal displays.

- **Examples**:
  ```bash
  ./ansi8bit2rgb_hex.py rgb 242          # Outputs: rgb(108,108,108)
  ./ansi8bit2rgb_hex.py rgb -n 242       # Outputs: color242    rgb(108,108,108)
  ./ansi8bit2rgb_hex.py hex 242          # Outputs: #6c6c6c
  ./ansi8bit2rgb_hex.py rgb              # Outputs all 256 colors
  ./ansi8bit2rgb_hex.py rgb 35-167       # Outputs colors from 35 to 167 (inclusive)
  ./ansi8bit2rgb_hex.py rgb 35,167       # Outputs the colors 35 and 167
  ```

---

> [!TIP] The script assumes sane input; adding exception handling for incorrect arguments could improve robustness. Additionally, the CLI argument parsing could benefit from using a library like `argparse` for better maintainability and clarity.