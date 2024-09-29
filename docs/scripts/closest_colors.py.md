# Closest Colors Finder

---

**closest_colors.py**: Find and compare the closest ANSI colors based on hexadecimal input.

---

### Dependencies

- `python`: A Python interpreter to run the script.

### Description

The **closest_colors.py** script is designed to help users find the closest ANSI colors based on a given list of hexadecimal color values. It achieves this by converting hex colors to their RGB equivalent and calculating the distance between colors using the Euclidean method in an RGB space.

#### Key Functions:

- `hex_to_rgb(hex_color)`: Converts a hexadecimal color string to an RGB tuple.
- `color_distance(c1, c2)`: Computes the distance between two RGB colors.
- `find_closest_color(target_color, possible_colors)`: Determines the closest available ANSI color to the given target color from a list.

The main logic of the script reads color values from a specified file (or uses a default set of ANSI colors) and identifies the nearest matching ANSI color for each desired color, outputting both the original color and its closest counterpart in a formatted manner.

### Usage

The script can be run from the command line and accepts two arguments:

1. **file1**: A text file containing the target hex color values, one per line.
2. **file2** (optional): A second text file containing possible ANSI colors in hex format. If not provided, a default color set is used.

To run the script, use the following command:

```
python closest_colors.py <file1> [<file2>]
```

#### Example:

Assuming you have a `colors.txt` file with the following content:

```
#FF5733
#33FF57
#3357FF
```

You would run the script like this:

```
python closest_colors.py colors.txt
```

The script will output each color from `colors.txt`, its corresponding nearest ANSI color along with the ANSI color code, formatted visually.

---

> [!TIP]  
> While the script is functional, consider adding input validation to handle invalid hex color formats and improve error handling for file operations. Additionally, a usage example can be included in the output message for user training.