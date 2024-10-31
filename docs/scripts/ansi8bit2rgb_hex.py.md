# Convert ANSI 8-bit Color to RGB/Hex

---

**ansi8bit2rgb_hex.py**: Converts ANSI 8-bit color codes to RGB or Hexadecimal format with options for colorized output.

---

### Dependencies

- `python`: This script requires Python to be installed on your system.

### Description

This script provides a utility to convert ANSI 8-bit colors (commonly used in terminal emulators) to either RGB or Hexadecimal color formats. It handles:

- **Standard Colors (0-15)**: Maps directly to basic color definitions.
- **Extended Colors (16-231)**: Calculates RGB values by decomposing the color code into red, green, and blue components.
- **Grayscale Colors (232-255)**: Represents shades of gray.

The script includes functions to format colors and handles command-line options for generating output strings that are either colorized or include color names. It can print color information for a single color, a range, or a list, in both formats.

### Usage

Run the script with one of the following command-line patterns. It can be executed directly in a terminal:

```bash
# Output RGB representation of color 242
./ansi8bit2rgb_hex.py rgb 242

# Output Hex representation of color 242
./ansi8bit2rgb_hex.py hex 242

# List RGB values of colors from 35 to 167
./ansi8bit2rgb_hex.py rgb 35-167

# List RGB values of colors 35 and 167
./ansi8bit2rgb_hex.py rgb 35,167

# Show help message
./ansi8bit2rgb_hex.py help
```

**Options**:

- `-n` or `--name`: Include color names in the output.
- `-c` or `--colorize`: Display output with ANSI colorized formatting.

Use these options after the format type (e.g., `rgb`, `hex`) but before specifying color numbers or ranges.

---

> [!NOTE]  
> Some improvements to consider include more explicit error handling when parsing command-line arguments, as the current parsing logic may not gracefully handle all incorrect inputs. Consider adding more robust argument validation and clearer user feedback for incorrect usage scenarios. Additionally, the script could benefit from modularizing the command-line parsing to simplify the main function logic.