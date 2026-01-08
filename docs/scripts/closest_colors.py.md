# Closest ANSI Color Matcher

---

**closest_colors.py**: Find closest palette colors to a list of target hex colors

---

### Dependencies

- `python` (tested with any modern Python 3)
- `sys` (Python stdlib)
- A terminal that supports **truecolor** escape sequences (`\033[38;2;R;G;Bm`) to display the preview blocks

### Description

This script helps you map arbitrary hex colors (your “desired” colors) to the nearest color from a “possible” palette by computing a simple Euclidean distance in RGB space.

- `hex_to_rgb()` parses `#RRGGBB` into an `(r, g, b)` tuple.
- `color_distance()` computes the RGB distance between two colors.
- `find_closest_color()` selects the palette entry that minimizes that distance.

Inputs:
- `file1` is a text file containing one hex color per line (e.g. `#aabbcc`).
- `file2` (optional) is a palette file. If omitted, the script falls back to an embedded **ANSI 256-color** table formatted like: `color42    #00cc66`.

Output (one line per desired color):
- left: original hex
- two colored swatches: original vs closest match
- right: closest hex and its palette name (e.g. `color42`)

This is useful when adapting themes for qtile / terminal configs on Arch, where you may want to approximate a palette (ANSI 256 or a curated set) while keeping colors visually consistent.

### Usage

tldr:

- Use embedded ANSI256 palette:
  
  python /home/matias/.scripts/bin/closest_colors.py desired.txt

- Use a custom palette file:
  
  python /home/matias/.scripts/bin/closest_colors.py desired.txt palette.txt

Example `desired.txt`:

  #1e1e2e
  #89b4fa
  #f38ba8

Example `palette.txt` lines:

  colorA  #112233
  colorB  #aabbcc

---

> [!TIP]
> Consider adding input validation (skip empty lines, ignore comments, handle invalid hex). Also, `possible_dict = dict([l.split()[::-1] for l in f2])` will break on blank/malformed lines; a safer parser would help. Finally, Euclidean RGB distance is quick but not perceptually uniform—if accuracy matters, consider converting to CIELAB (via `colorspacious`/`colormath`) or at least using weighted RGB.