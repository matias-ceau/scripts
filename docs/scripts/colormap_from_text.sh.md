# Color Map Extractor

---

**colormap_from_text.sh**: Simple script that extracts color palettes from config files

---

### Dependencies

- `bash`: The script is written in Bash and requires a Bash environment to run.
- `bat`: Used for syntax highlighting of the usage message; ensure it is installed for better readability.

### Description

The `colormap_from_text.sh` script is designed to extract color palettes from input config files or from standard input. The script processes hex color codes, allowing users to output these codes in various formats including hexadecimal, RGB, or visual color blocks.

#### Features:

- Supports extraction of color codes with options to display them in different formats:
  - `-x` or `--hex-code`: Outputs color codes in hexadecimal format.
  - `-r` or `--rgb`: Converts the hex codes to `rgb(r, g, b)` format.
  - `-c` or `--color`: Outputs a visual block of color along with the color code.

- Checks for incompatible options (e.g., `-x` and `-r` cannot be used together) and provides helpful error messages when incorrect arguments are supplied.

### Usage

To execute the script, you can either pipe input directly into it or specify files from which to extract colors. Here are a few usage examples:

1. **Piping input directly**:

```bash
echo "Here is some text with a color #FF5733" | ./colormap_from_text.sh --hex-code
```

2. **Reading from a file**:

```bash
./colormap_from_text.sh --rgb config.txt
```

3. **Displaying color blocks**:

```bash
echo "#FFFFFF #000000 #FF5733" | ./colormap_from_text.sh --color
```

For general usage and help message, you can run:

```bash
./colormap_from_text.sh
```

---

> [!TIP]  
> Consider adding more detailed error handling to improve user experience. For instance, inform the user if no valid hex codes were found in the input. Additionally, providing examples directly in the help message may guide users better.