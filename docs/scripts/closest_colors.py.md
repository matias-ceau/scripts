# Closest Terminal Colors Utility

---

**closest_colors.py**: Find the closest matching terminal color for a list of color hex codes.

---

### Dependencies

- `python` (standard library; no external packages required)

### Description

This script is designed to help you match arbitrary hex color codes to their closest equivalent from a palette of terminal colors (by default, the 8-bit ANSI palette). It's particularly useful when customizing color schemes for terminal emulators, status bars (like in qtile), or anywhere color fidelity matters but you are limited to discrete color options.

The script operates by:
- Accepting an input file (`file1`) that contains the hex codes of colors you care about (one per line).
- Optionally accepting a second file (`file2`) which defines the color palette to compare against, in `name HEX` format separated by whitespace (default: the internal 256-color ANSI palette).
- Calculating the Euclidean distance between each requested color and all palette entries to find the closest match.
- Printing a visually rich output with:
  - Original and closest color blocks shown via terminal ANSI escape codes.
  - Both color hex codes and the palette "name" for the closest match.

**Key Functions:**
- `hex_to_rgb(hex_color)`: Converts a `#RRGGBB` string to an (R, G, B) tuple.
- `color_distance(c1, c2)`: Standard Euclidean distance in 3D RGB space.
- `find_closest_color(target_color, possible_colors)`: Finds the closest palette color (by RGB) to `target_color`.

### Usage

**Run from the terminal:**

```
python closest_colors.py <file1> [<file2>]
```

- `<file1>`: Path to a file with your desired hex colors, one per line. Example:
  ```
  #ff8800
  #CAFE00
  #222233
  ```
- `<file2>` (optional): Custom palette file with lines like:
  ```
  cyan   #00ffff
  red    #ff0000
  green  #00ff00
  ```

**Example:**
```
python closest_colors.py ~/mycolors.txt
python closest_colors.py ~/mycolors.txt ~/custom_palette.txt
```

This works seamlessly with your qtile/Arch Linux setup. You can also bind this script to a key or call it from other scripts as needed.

---

> [!TIP]
>
> - The script expects the input and palette files to be formatted strictly (one hex code per line in `file1`; `<name><tab><hex>` or `<name> <hex>` in `file2`).
> - The internal ANSI palette is embedded as a single (very long) string. Consider externalizing this to a file both for maintainability and performance.
> - The output uses ANSI escape codes, so usage outside a true terminal (e.g., some logging systems or editors) may not display color blocks correctly.
> - Error handling is minimal; malformed lines or missing files will cause uncaught exceptions. Input validation could be improved for robustness.
> - You might want options for different color distance heuristics (perceptual distances, for example).