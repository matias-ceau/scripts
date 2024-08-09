# Flexoki Color Show Script

---

**flexoki_show.sh**: Generate a color palette with hex, RGB values, and names for quick reference.

---

### Dependencies

- `bash`: The script is written in bash and requires a bash shell for execution.

### Description

The **Flexoki Color Show** script is designed to generate a neatly formatted color palette directly in your terminal. It utilizes a series of ANSI escape codes to format the output, enabling color representation of each entry along with corresponding hexadecimal, RGB values, and easy-to-remember names.

The script defines a single function, `line_generator`, which outputs a header followed by a list of colors, each represented by a block of color and associated details:

- **Hex Value**: Displays the color in hexadecimal format.
- **RGB Value**: Shows the RGB representation of the color.
- **Name**: A mnemonic name for quicker identification.
- **Short Code**: An abbreviated code for faster reference.
- **UI Uses**: Indicates where the color is typically used or relevant context.
- **Syntax**: A placeholder for additional syntax or remarks.

The script employs a customizable block symbol (`\u2588`) to visually represent each color, enhancing readability.

### Usage

To execute the script, simply run it from your terminal. It does not take any command-line arguments and will display the color palette in the default terminal window.

```bash
bash /home/matias/.scripts/flexoki_show.sh
```

Alternatively, you can create a keybinding in your window manager (qtile) to execute this script for quick access:

```python
Key([mod], "f", lazy.spawn("bash /home/matias/.scripts/flexoki_show.sh")),
```

This binding would allow you to quickly pull up the color palette without needing to enter the command manually every time.

---

> [!TIP] 
> This script currently is static; consider allowing parameters for user-defined colors or file output options. Including comments or documentation within the script for future reference would also enhance its maintainability. Additionally, testing on various terminals for compatibility with ANSI colors could be beneficial to ensure consistent appearance across environments.