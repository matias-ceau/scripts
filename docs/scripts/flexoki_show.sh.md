# Flexoki Color Display Script

---

**flexoki_show.sh**: Display a formatted chart of colors with HEX, RGB, and names.

---

### Dependencies

- `bash`: The script is written in Bash and requires a compatible environment.

### Description

The `flexoki_show.sh` script generates a visually formatted table displaying various colors along with their HEX values, RGB representations, shorthand names, and additional notes. This script can be particularly useful for designers, developers, or anyone interested in color palettes and their specifications.

The script uses ANSI escape codes for styling and colored output. Key components include:

- `block`: A string representing a block character used for visual representation.
- `BOW`: An ANSI escape sequence for a bold and bright appearance, enhancing the header and certain entries.
- The `line_generator` function encapsulates the logic to generate the entire color list, showcasing a variety of colors commonly used in applications and web design.

Each color entry includes:
- HEX color code.
- RGB color value.
- Short names for quick reference.
- Specific usages indicated in captions.

### Usage

To utilize the script, perform the following steps from a terminal:

1. Open a terminal in your Arch Linux environment.
2. Execute the script by running:

   ```bash
   bash /home/matias/.scripts/flexoki_show.sh
   ```

Upon execution, the terminal will display a well-formatted chart like the following:

```
  HEX                  RGB            NAME           SHORT          UI              SYNTAX                    
#d14d41 - [block] - 209,77,65    - red-400     -  re      [9]  -
#af3029 - [block] - 175,48,41    - red-600     -  re-2    [1]  - Error text       Invalid, imports 
...
#fffcf0 - [block] - 255,252,240  - paper       -  (bg)         -
```

This output provides immediate reference to the colors and their details.

---

> [!TIP] 
> The script might be extended to accept command-line arguments that allow users to customize the output, such as filtering by color families or allowing user-defined colors. Additionally, it currently outputs all colors statically; implementing dynamic color selection functionality could enhance usability.