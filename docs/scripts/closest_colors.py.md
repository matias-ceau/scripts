# Closest Colors Finder

---

**closest_colors.py**: Finds the nearest terminal colors for specified hex colors.

---

### Dependencies

- `python`: The programming language used for this script.

### Description

The `closest_colors.py` script is designed to determine the closest match of terminal colors based on specified hexadecimal color values. Utilizing the ANSI 8-bit color palette, it accepts a file containing hex color codes and calculates which of the predefined 256 colors are closest, both in hex and RGB formats.

#### Key Functions:

- **`hex_to_rgb(hex_color)`**: Converts a hex color string (e.g., `#ff0000`) to an RGB tuple (e.g., `(255, 0, 0)`).
  
- **`color_distance(c1, c2)`**: Computes the Euclidean distance between two RGB colors, which represents how similar the two colors are.
  
- **`find_closest_color(target_color, possible_colors)`**: Finds the closest color from a list of available colors using the previously defined functions.

#### Main Logic:
The script reads a file with desired hex colors and compares each color against the standard ANSI 256 color palette. It then outputs the closest matching color visually, highlighting the original color and its matching ANSI representation.

### Usage

To run the script, execute the following commands in the terminal:

- **Single file argument**:
  
  ```bash
  python closest_colors.py path/to/your/color_file.txt
  ```

- **Two file arguments** (the second file can provide an alternative list of colors):
  
  ```bash
  python closest_colors.py path/to/your/color_file.txt path/to/alternative_colors.txt
  ```

#### Example

Given a file `my_colors.txt` with the following hex values:

```
#ff5733
#33ff57
#3357ff
```

You can execute:

```bash
python closest_colors.py my_colors.txt
```

This command will output pairs of the original hex colors along with their closest ANSI 256 color representation visually.

---

> [!TIP]  
> The script currently assumes that the input color file is correctly formatted with valid hex codes. To enhance usability, consider adding input validation to check for malformed hex codes, and improve error handling when reading files. Additionally, enhancing the visual representation with clearer spacing or formatting could improve readability.