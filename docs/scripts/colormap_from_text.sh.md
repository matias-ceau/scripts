# Color Palette Extractor

---

**colormap_from_text.sh**: Simple script that extracts color palettes from config files 

---

### Dependencies

- `bat`: A clone of `cat`, with syntax highlighting and Git integration that is used for pretty printing the usage message. Make sure it is installed for enhanced output.

### Description

The `colormap_from_text.sh` script is designed to extract color palettes from various configuration files through standard input or specified file arguments. It identifies hex color codes in the format `#RRGGBB` and provides options to output these colors in different formats. The script can output colors in hex format, RGB format, or as colored blocks, depending on the provided command-line arguments.

#### Key Features:
- **Color Format Options**: Supports outputting colors in:
  - Hex format (`-x` or `--hex-code`)
  - RGB format (`-r` or `--rgb`)
  - Color blocks in the terminal (`-c` or `--color`)
- **Input Flexibility**: Can read color codes from piped input or from specified files.
- **Error Handling**: Detects incompatible options and provides usage instructions.

### Usage

To utilize the script, you can use it through standard input or pass files directly. 

#### Command-Line Syntax:
```bash
<stdout> | ./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color] <file(s)>
```

#### Examples:

1. **Extract colors from a file** and output in hex format:
   ```bash
   ./colormap_from_text.sh -x file.txt
   ```

2. **Pipe output from another command**:
   ```bash
   ls ~/.config | ./colormap_from_text.sh -c
   ```

3. **Output in RGB format**:
   ```bash
   cat colors.txt | ./colormap_from_text.sh -r
   ```

4. **Show colored blocks** directly in your terminal:
   ```bash
   ./colormap_from_text.sh -c theme.txt
   ```

---

> [!TIP]  
> Consider adding additional options to support different color formats (like HSL) and improve error reporting for unsupported file types. A test suite could also be developed to ensure that the script handles a diverse range of use cases robustly.