# Color Map Extractor

---

**colormap_from_text.sh**: Script to extract color palettes from text files

---

### Dependencies

- `bat`: A command-line tool that provides syntax highlighting and file viewing. This script uses it to display usage information in a styled format.

### Description

The `colormap_from_text.sh` script is designed to extract color palettes from text files, particularly those containing HEX color codes. The script reads from standard input (stdin) or from specified files and is capable of outputting colors in various formats:

- HEX format (e.g., `#ffffff`)
- RGB format (e.g., `rgb(255, 255, 255)`)
- RGB values as separate integers (e.g., `255, 255, 255`)

The script employs the following key features:

- Argument parsing: The script allows users to specify options for desired output formats and validations to prevent conflicting options.
- Color extraction: It utilizes `grep` to find HEX codes and then converts them into RGB using `printf`.
- Color visualization: When the `--color` option is enabled, the script visually displays the color in the terminal with the corresponding RGB or HEX code.

### Usage

To use the script effectively, you can either pipe data into it or provide it with file names as arguments. Usage syntax is as follows:

```bash
<stdout> | ./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color] <file(s)>
```

**Examples**:

1. Extract and display colors in HEX format from a file:
   ```bash
   ./colormap_from_text.sh -x example.txt
   ```

2. Output colors in RGB format:
   ```bash
   echo "Here is a color: #ff5733" | ./colormap_from_text.sh -r
   ```

3. Display colors visually in the terminal:
   ```bash
   cat colors.txt | ./colormap_from_text.sh -c
   ```

4. Check for errors: If attempting to use conflicting options:
   ```bash
   ./colormap_from_text.sh -x -r example.txt
   ```

---

> [!TIP]  
> Consider adding error handling for invalid file inputs and implementing a help flag (e.g., `-h` or `--help`) that shows the usage instructions directly without needing to invoke the script. This will improve user experience.