# Closest Colors Script

---

**closest_colors.py**: Find the closest ANSI color to a set of target colors.

---

### Dependencies

- `python`: The script requires Python to be executed.
- `sys`: Module for accepting command-line arguments.

### Description

This script is designed to find the closest matching color from a pre-defined list of ANSI colors to any hex colors specified in an input file. It leverages basic color conversion and distance calculation techniques. 

The core functionality revolves around:
- **`hex_to_rgb`**: Converts a hexadecimal color code to its RGB counterpart.
- **`color_distance`**: Computes the distance between two RGB colors using Euclidean distance.
- **`find_closest_color`**: Determines the closest ANSI color by comparing distances between the target color and each possible ANSI color.

The script reads a list of desired colors from `file1`. Optionally, it reads possible matching colors from `file2`. If `file2` isn't provided, a default ANSI color list is used. The results are displayed with an ANSI escape code showing the original and closest matched colors visually in the terminal.

### Usage

To run the script, ensure that you have Python installed on your system (Arch Linux) and use the following command:

```bash
python /home/matias/.scripts/closest_colors.py <file1> [file2]
```

- **`<file1>`**: Path to the file containing the hex-color codes you wish to analyze.
- **`[file2]`**: (Optional) File containing the list of potential colors; defaults to a built-in ANSI list if omitted.

Example:
```bash
python /home/matias/.scripts/closest_colors.py colors_to_check.txt
```

---

> [!TIP]
> The script currently lacks proper error handling for invalid hex codes or file read errors. It could benefit from adding more robust exception handling to deal with potential issues like malformed input data or missing files. Moreover, improving the user feedback with a clearer usage guide would enhance usability.