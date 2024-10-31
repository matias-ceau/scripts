# Closest Colors Finder

---

**closest_colors.py**: A script to find and display the closest ANSI color matches to a list of provided hex colors

---

### Dependencies

- `Python 3`: Required to run the script as it uses Python's standard libraries.

### Description

The `closest_colors.py` script is designed to map a list of given hex colors to their closest counterparts in an ANSI 8bit color palette. This tool could be particularly useful for developers working in terminal environments where specific colors need to be converted to available ANSI colors.

The script uses several functions:
- **`hex_to_rgb`**: Converts a hex color value to an RGB tuple.
- **`color_distance`**: Calculates the Euclidean distance between two RGB color tuples.
- **`find_closest_color`**: Finds the nearest color in the provided palette to a given hex color using the RGB distance metric.

The script processes input from two files:
- **`file1`**: Contains the list of hex colors.
- **`file2`** (optional): Specifies the list of possible colors. If not provided, a default ANSI palette is used.
  
For each target color, the script calculates the closest color from the possible palette and prints a visual comparison using ANSI escape sequences to show the original and closest colors.

### Usage

The script is run via the command line and has the capability to visualize the results directly in the terminal:

```bash
python closest_colors.py <file1> <file2>
```

- **`file1`**: Mandatory, a file containing a list of target hex colors, one color per line.
- **`file2`**: Optional, a file containing possible hex color matches, one per line. If not provided, the script uses a pre-defined ANSI 8bit color set.

#### Example

```bash
# With a file containing desired hex codes
python closest_colors.py colors.txt

# With a file containing desired hex codes and another specifying the color palette
python closest_colors.py colors.txt palette.txt
```

---

> [!NOTE] 
> The script currently reads directly from files and does not support standard input or interactive color input, which could be beneficial for more dynamic uses. Additionally, including a feature that prints available color names instead of just codes might improve usability.
Also, it might be beneficial to optimize the color distance calculation for larger color palettes to improve performance.