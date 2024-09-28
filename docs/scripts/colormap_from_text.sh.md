# Color Palette Extractor from Config Files

---

**colormap_from_text.sh**: Simple script that extracts color palettes from text or configuration files in either hex or RGB format.

---

### Dependencies

- `bash`: The script is written in bash and requires the bash shell to execute.
- `grep`: Utilized for finding color patterns in text.
- `sort`: Used for sorting and ensuring unique colors.
- `bat`: An enhanced cat command with syntax highlighting (optional for usage display).
  
### Description

The `colormap_from_text.sh` script is a utility that extracts color information from text files or standard input, making it useful for configuration files often containing color codes. It supports color extraction in both hexadecimal and RGB format and can visually display the retrieved colors using ANSI escape codes for terminal color output.

#### Key Features:
- **Hexadecimal and RGB Support**: Option to output colors in either hex (`#RRGGBB`) or RGB (`rgb(R, G, B)`) format.
- **Visual Display**: Option to display the colors with a background matching the color code.
- **Incompatible Options**: Ensures that both hex and RGB options are not used simultaneously.
- **Flexibility**: Can process color codes from both files and piped inputs.

### Usage

Run this script in the terminal. It can take inputs in two forms:

1. **Piped Input**
   ```bash
   cat somefile.txt | ./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
   ```

2. **Direct File Input**
   ```bash
   ./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color] file1.txt file2.txt
   ```

#### Options:
- `-x` or `--hex-code`: Outputs colors in hex format.
- `-r` or `--rgb`: Outputs colors in RGB format.
- `-c` or `--color`: Display the color in the terminal.

### Examples

- Extract and display hex colors from a configuration file:
  ```bash
  ./colormap_from_text.sh -x -c configfile.conf
  ```

- Extract unique RGB colors piped from a file and print them:
  ```bash
  cat configfile.conf | ./colormap_from_text.sh -r
  ```

---

> [!TIP]
> The script currently only extracts 6-digit hex colors and does not account for 3-digit shorthand colors or alpha channels. Extending the regex to include these cases could enhance functionality. Also, avoid using `cat` in line 52 with piped input as it is redundant.