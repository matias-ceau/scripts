# ansi8bit2rgb_hex.py

---

**ansi8bit2rgb_hex.py**: Converts 8-bit ANSI color codes to RGB or HEX representations with optional colorized output and names

---

### Dependencies

- `python` (standard library only)
    - Uses: `os`, `sys`
- **No third-party libraries required**

---

### Description

This script provides a flexible utility for converting 8-bit ANSI color codes (0–255) into RGB or hexadecimal (HEX) color representations. It can handle:
- Single color codes (e.g., 42)
- Comma-separated lists (e.g., 42,100,255)
- Ranges (e.g., 50-99)
- The full palette (default if no color specified)

Internally, the conversion logic is based on the standard xterm 256-color palette:
- **0–15:** System/standard colors
- **16–231:** 6×6×6 color cube (calculates R, G, B steps)
- **232–255:** Greyscale ramp

Key features:
- Output format: Choose between `rgb(R,G,B)` or HEX (`#rrggbb`)
- Optional coloring: Visually show the color in the terminal (assuming terminal ANSI support)
- Optional labeling: Prepend each output with its ANSI color name (e.g., `color242`)
- Batch output: Support for ranges/lists and displaying all 256 colors

The script also provides clear usage instructions, in-terminal help, and error handling for out-of-range/invalid arguments.

---

### Usage

You can execute this script directly from the terminal, assign it to a keybinding in Qtile, or invoke it from other scripts. Here are some usage examples:

```
# Show single color in RGB
ansi8bit2rgb_hex.py rgb 242
# Output: rgb(108,108,108)

# Show single color in HEX
ansi8bit2rgb_hex.py hex 242
# Output: #6c6c6c

# Show with name and as color block
ansi8bit2rgb_hex.py rgb -n -c 196

# Show a range of colors, colored and with their names
ansi8bit2rgb_hex.py hex --colorize --name 20-25

# Show all ANSI 8-bit colors in HEX
ansi8bit2rgb_hex.py hex

# Show help/usage
ansi8bit2rgb_hex.py help
```

> Tip: You can assign this script as a rofi runner, a custom dmenu, or a Qtile keybinding for fast lookups.

---

> [!TIP]
> - The argument parsing is functional, but could be made clearer (as currently, any extra argument is treated as a color selector; could lead to confusion if options are placed after the number).
> - The script doesn't currently validate for argument order/uniqueness or mutually exclusive options; e.g., you can pass both `-n` multiple times with no effect.
> - Adding support for piping from stdin (for bulk operations), a more idiomatic argparse usage, or JSON output for scripting would increase versatility.
> - The colorized output can be difficult to read with some terminals if contrasting foreground text is not used. Consider implementing the brightness-based contrasting text color technique outlined in your commented example code at the bottom of the script.
> - Minor typo: `oolorize` should be `colorize` in the usage section.
> - Overall, the script is robust for everyday use in a color theming/workflow context for Qtile/Arch.