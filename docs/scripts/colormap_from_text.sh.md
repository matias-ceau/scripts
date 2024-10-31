# Extract Color Palettes from Config Files

---

**colormap_from_text.sh**: Extracts hex or RGB color codes from configuration files

---

### Dependencies

- `bash`: This script is written and executed in bash.
- `grep`: Used for extracting color codes using regex.
- `sort`: Sorts and removes duplicate color entries.
- `bat`: Displays usage information with syntax highlighting (`-plhelp` indicates plain output for help).

### Description

The script `colormap_from_text.sh` is designed to extract color palettes from configuration files or piped text input. It searches for hexadecimal color codes in the format `#RRGGBB` using regular expressions. The script can output these colors in either their hex format or as RGB values and has a neat feature to display the color using ANSI color codes.

The main functionalities include:
- Extracting unique color codes from input.
- Converting hexadecimal codes into RGB values if requested.
- Displaying swatches of colors in the terminal.

Additionally, the script offers flexibility with command-line options:
- `-x` or `--hex-code` for hex output.
- `-r` or `--rgb` for RGB output.
- `-c` or `--color` for displaying a visual color swatch.

### Usage

You can use the script with or without input redirection. For instance:

```bash
cat your_config_file.conf | colormap_from_text.sh -x
```

Or directly on files:

```bash
colormap_from_text.sh -r -c your_config_file1.conf your_config_file2.conf
```

Available options:
- `-x` or `--hex-code`: Outputs color codes in `#RRGGBB` format.
- `-r` or `--rgb`: Outputs colors in `rgb(R, G, B)` format.
- `-c` or `--color`: Displays a terminal color swatch before the color code.

If executed without appropriate options or input redirection, it will display usage information.

---

> [!TIP]
> While the script provides useful functionalities, users on Arch Linux with utilities like `bat` may find it less portable across different environments. Consider handling the usage without format-dependent features, like displaying usage using plain text. Additionally, consider implementing checks for the presence of `bat`, or providing an alternative non-styled usage output.