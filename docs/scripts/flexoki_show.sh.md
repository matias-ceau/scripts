# Flexoki Color Display Script

---

**flexoki_show.sh**: Displays a table of colors with HEX, RGB, and descriptions

---

### Dependencies

- `bash`: The script is a Bash script and requires Bash to be present on the system.

### Description

This script, `flexoki_show.sh`, generates a detailed table displaying color codes in both HEX and RGB formats, along with their names and various contexts of use. It is designed to help you visualize a palette of colors in a terminal on Arch Linux with the qtile window manager.

The script defines a function named `line_generator` which contains ANSI escape codes to colorize and format the output in a terminal, making use of Unicode block characters to illustrate colors visually. Each color entry includes:

- **HEX Value**: The hexadecimal representation of the color.
- **RGB Values**: The Red, Green, Blue values of the color.
- **Name**: A human-readable name for easier identification.
- **Short Name**: A short alias for quick reference.
- **UI Indicator**: Which part of the UI uses this color (if any).
- **Syntax Highlighting Context**: Where this color is used in syntax highlighting (such as error text, keywords, or comments).

Colors are printed in blocks next to their details, enhancing visibility and differentiation. The formatting uses bold (`\e[7m`) and italics (`\e[3m`) for aesthetic purposes.

### Usage

To use the script, ensure that it has the correct executable permissions. You can make it executable with the following command:

```bash
chmod +x /home/matias/.scripts/flexoki_show.sh
```

Run the script by executing:

```bash
./flexoki_show.sh
```

You can bind this script to a key combination in qtile to quickly display the color palette in your terminal.

---

> [!NOTE]
> Consider using command-line arguments to selectively display certain palettes or toggle the display of certain column details to enhance the flexibility of the script. Additionally, reduce redundant code by looping through color data to generate the table dynamically instead of hardcoding each line, which will improve maintainability and scalability.