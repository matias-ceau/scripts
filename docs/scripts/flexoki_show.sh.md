# Flexoki Color Show

---

**flexoki_show.sh**: A script to display a color palette with HEX, RGB, and names.

---

### Dependencies

- `bash`: The script is written in Bash and requires a Bash shell to run.

### Description

The `flexoki_show.sh` script is a Bash utility designed to present a visually appealing palette of colors. It generates a structured output in the terminal that includes the following columns:

- **HEX**: The hexadecimal representation of the color.
- **RGB**: The red, green, and blue values in decimal.
- **NAME**: A descriptive name for the color.
- **SHORT**: An abbreviation for quick references.
- **UI**: A category of UI elements related to the color.
- **SYNTAX**: Additional syntax or reference notes.

The main function, `line_generator`, uses escape sequences to format colors and styles in the terminal output, leveraging color codes to fill the blocks visually. Each line of output introduces a different color, making it easy for users to visually coordinate colors with their respective codes and descriptions.

### Usage

To utilize the script, execute it directly from a terminal session. Simply open your terminal and run:

```bash
bash /home/matias/.scripts/flexoki_show.sh
```

This will display the color palette in the terminal, allowing you to view the colors side by side with their corresponding codes and details.

The script can also be integrated into your Qtile configuration for quick access. For example, bind the execution of this script to a key combination in your `~/.config/qtile/config.py` like so:

```python
from libqtile import hook
from libqtile import key

keys = [
    key.Key([mod], "c", lazy.spawn("bash /home/matias/.scripts/flexoki_show.sh")),
    # Add other key bindings here
]
```

---

> [!TIP]
> Consider enhancing the script by allowing command-line arguments to filter or search for specific colors. Additionally, you could add an option to output the color palette to a text file for documentation purposes, improving the usability of the tool.