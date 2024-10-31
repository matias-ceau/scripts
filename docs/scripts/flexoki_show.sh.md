# Flexoki Color Scheme Display

---

**flexoki_show.sh**: Display script for a custom color scheme in terminal using Bash.

---

### Dependencies

- `bash`: This script requires the Bash shell to execute.
- Escape sequences for colors are used extensively, so ensure your terminal supports ANSI color codes.

### Description

The `flexoki_show.sh` script is designed to display a comprehensive list of colors in both hexadecimal and RGB formats, alongside their representative names, abbreviations, and usage contexts. The script utilizes a combination of ANSI escape codes to render this list with attractive color blocks directly in the terminal, providing users with a visual reference for a predefined set of color scheme elements. Each color displays in a formatted line showing its HEX value, RGB equivalent, a small block of the actual color, and descriptions for easy identification.

The structure of the table presented by the script follows a consistent pattern:
- **HEX**: The hexadecimal color code.
- **RGB**: RGB values to give a sense of the color's appearance in the RGB spectrum.
- **NAME**: The descriptive name aligned with its shade and intensity.
- **SHORT**: A short abbreviated form for quick reference in configurations.
- **UI/SYNTAX**: Descriptions of the color's potential usage in user interfaces and coding syntax.

### Usage

This script can be executed directly from your terminal. Here are the steps and an example of how you might use it:

1. Open a terminal session.
2. Navigate to the directory containing the script (for example, `/home/matias/.scripts/bin`).
3. Execute the script using:

```bash
./flexoki_show.sh
```

You can integrate this script with your workflow in qtile, possibly assigning it to a specific keybinding to quickly display colors whenever necessary.

---

> [!TIP]
> While the script efficiently renders the intended color table, maintaining or updating the color list can be cumbersome due to hard-coded values and escape sequences. Consider abstracting color definitions into a separate configuration file for better maintainability. Also, providing command-line options to filter colors or display only a subset might improve usability.