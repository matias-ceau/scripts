# Colormap Extractor from Text Configs

---

**[colormap_from_text.sh](/colormap_from_text.sh)**: Extracts color palettes from config files.

---

### Dependencies

- `grep`: A command-line utility for searching plain-text data.
- `printf`: A utility to format and print data, required for RGB conversion.

### Description

The `colormap_from_text.sh` script is a straightforward Bash utility designed to extract and format color codes from text files, like configuration files. The script primarily focuses on hexadecimal color codes, which it identifies and processes in one of three output formats: Hexadecimal, RGB, or a plain RGB list.

Key functionalities include:

- **Argument Parsing**: The script accepts command-line arguments which specify the desired output format.
  - `-x` or `--hex-code` outputs the colors in hexadecimal format.
  - `-r` or `--rgb` provides the colors in an RGB format.
  - `-c` or `--color` outputs colors along with their visual representation in the terminal.
  
- **Error Handling**: It prevents incompatible options being selected together (e.g., Hex and RGB at once) and provides user-friendly usage instructions.

- **Color Extraction**: Utilizes `grep` to find hex codes, sorts them uniquely, and converts hex to RGB when needed.

### Usage

To run the script, execute it in your terminal, passing in any of the flags according to your desired output format:

```bash
# Output colors in hexadecimal format
./colormap_from_text.sh -x

# Output colors in RGB format
./colormap_from_text.sh -r

# Output RGB values and display colors in terminal
./colormap_from_text.sh -c
```

You can also combine options, but remember that `-x` and `-r` are incompatible.

---

> [!TIP]  
> The script could benefit from adding more comments for clarity, especially within the main loop. Further, consider implementing argument validation to ensure the script functions correctly with varying input types, such as reading from specific configuration files or directories. This would enhance its versatility.
