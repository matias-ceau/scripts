# ANSI 8-Bit Color Converter to RGB and HEX

---

**ansi8bit2rgb_hex.py**: Converts 8-bit ANSI colors to RGB or HEX format.

---

### Dependencies

- `python`: Required to run the script, as it is written in Python.

### Description

The `ansi8bit2rgb_hex.py` script provides functionality to convert ANSI 8-bit color codes into RGB and HEX color formats. This is particularly useful for applications needing color representation in a more readable format (like web design or graphical design).

The core features of the script are encapsulated in various functions:

- **ansi_to_rgb(color)**: Converts an 8-bit ANSI color code into a tuple of RGB values. It handles standard colors (0-15), 6x6x6 cube colors (16-231), and grayscale colors (232-255).
- **format_color(rgb, color_format)**: Formats the RGB tuple into either HEX or RGB string format based on the specified `color_format`.
- **print_colors(colors, color_format, colorize=False, print_names=False)**: Prints the resulting colors in the selected format, with options for colorizing the output on the terminal and including the color names.

### Usage

You can execute the script from the terminal to convert color codes. The basic command structure is:

```bash
python ansi8bit2rgb_hex.py <command> [options] <number>|<range>|<list>
```

- **Commands**:
  - `rgb`: Output the colors in RGB format.
  - `hex`: Output the colors in HEX format.
  - `help`: Display this help message.

- **Options**:
  - `--name`, `-n`: Print the color name alongside the value.
  - `--colored`, `-c`: Colorize the output in the terminal.

#### Examples:
```bash
python ansi8bit2rgb_hex.py rgb 242       # Outputs: rgb(108,108,108)
python ansi8bit2rgb_hex.py rgb -n 242    # Outputs: color242    rgb(108,108,108)
python ansi8bit2rgb_hex.py hex 242       # Outputs: #6c6c6c
python ansi8bit2rgb_hex.py rgb            # Outputs all 256 colors
python ansi8bit2rgb_hex.py rgb 35-167     # Outputs colors from 35 to 167 inclusive
python ansi8bit2rgb_hex.py rgb 35,167     # Outputs colors 35 and 167
```

---

> [!TIP]  
> The script lacks comprehensive error handling for cases where the supplied arguments do not match expected formats or ranges. Additionally, the main function could benefit from refactoring for improved clarity and modularity. Consider using a configurations object to handle arguments and flags, which would streamline the parsing logic.