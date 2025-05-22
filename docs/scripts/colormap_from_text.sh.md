# Colormap Extractor from Text Files

---

**colormap_from_text.sh**: Extracts and displays unique color codes from text or config files in various formats

---

### Dependencies

- `bash` — Shell interpreter for execution.
- `grep` — For extracting hex color codes from text.
- `sort` — For finding unique color codes.
- `bat` — For colored help output; will fail if not installed.
- `cat` — For reading files to stdin.
- (Optional) `qtile` — Not directly required, but can be integrated with keybindings in your setup.

---

### Description

This script extracts all unique hexadecimal color codes (`#RRGGBB` format, case-insensitive) from standard input or one or more text files. It is particularly useful for parsing configuration files to quickly generate palettes (for example, from your qtile, gtk, or neovim configs).

Depending on the flag, it outputs the palette as:
- Hex codes (`#RRGGBB`)
- RGB tuples (`rgb(r, g, b)`)
- CSV (`r, g, b`)
- Optionally, colors are previewed visually in the terminal with a background swatch.

**Features:**
- Reads from stdin (pipe) or file arguments.
- Use `-x/--hex-code` for hex output, `-r/--rgb` for `rgb(r,g,b)` output, `-c/--color` for terminal color preview.
- Formats are mutually exclusive for hex and rgb.
- Quick visualization of color palettes from any text/config file.

---

### Usage

**From command line with file(s):**
```
colormap_from_text.sh -x -c ~/.config/qtile/config.py
```

**From a pipeline:**
```
cat ~/.config/gtk-3.0/settings.ini | colormap_from_text.sh -r
```

**Examples:**
```sh
colormap_from_text.sh -x       # (with stdin) Outputs only hex codes
colormap_from_text.sh -r       # (with stdin) Outputs only `rgb(r, g, b)`
colormap_from_text.sh -c       # (with stdin) Outputs color blocks and csv values
colormap_from_text.sh -x -c my_colors.conf
cat myfile | colormap_from_text.sh -r -c
```

- **Invalid usage** (e.g., both -x and -r):  
  Script displays an error and usage message.

---

> [!TIP]
> **Critique:**  
> - The script assumes all color codes are in `#RRGGBB` format (no support for shorthand `#RGB` or alpha channels).
> - Dependency on `bat` for help output may cause failure if `bat` is not installed; suggest a fallback to standard echo/cat if `bat` is missing.
> - Only the first six digits after `#` are parsed, so malformed or extended color codes could sneak in without warning.
> - The option parsing does not allow you to mix files and stdin conveniently; if both are detected, priority is not clear.
> - It could be made more robust by accepting multiple files directly with correct POSIX argument handling.
> - You might consider supporting inline comments (to filter out pseudo-colors), or supporting output in other formats (like JSON for script consumption).
