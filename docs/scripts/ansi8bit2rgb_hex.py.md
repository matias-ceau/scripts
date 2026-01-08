# ANSI 8-bit to RGB / HEX Converter

---

**ansi8bit2rgb_hex.py**: Convert ANSI 256-color codes to RGB or HEX (with optional preview)

---

### Dependencies

- `python` (3.10+) — uses `match/case` pattern matching
- A terminal supporting ANSI 256 colors (for `--colorize` output)

### Description

This script converts ANSI 8-bit (0–255) color codes (often used in terminal themes, `ls`, `bat`, `fzf`, etc.) into either:

- `rgb(r,g,b)` strings, or
- `#rrggbb` hex strings

The conversion follows the standard xterm 256-color palette mapping:

- `0–15`: standard ANSI colors (fixed table)
- `16–231`: 6×6×6 color cube (`51` step per channel)
- `232–255`: grayscale ramp (`(color-232)*10 + 8`)

Output can be optionally:
- labeled with `colorN` using `--name/-n`
- “previewed” by setting the background to that ANSI color using `--colorize/-c` (useful when tuning qtile/terminal palettes)

If no color argument is provided, it prints values for all 256 colors.

### Usage

Convert a single color:

    ansi8bit2rgb_hex.py rgb 242
    ansi8bit2rgb_hex.py hex 242

Add labels and/or background preview:

    ansi8bit2rgb_hex.py rgb -n 242
    ansi8bit2rgb_hex.py hex -c -n 35

Ranges and lists:

    ansi8bit2rgb_hex.py rgb 35-167
    ansi8bit2rgb_hex.py rgb 35,167,200

Dump the whole palette (great for theme work):

    ansi8bit2rgb_hex.py rgb
    ansi8bit2rgb_hex.py hex -n

Help:

    ansi8bit2rgb_hex.py help

---

> [!TIP]
> Improvements to consider:
> - The usage text says `--colored`, but the actual option is `--colorize`; also there’s a small typo (“oolorize”).
> - Argument parsing is a bit fragile: it loops over `sys.argv[1:]` (including `rgb/hex`) and always treats the last token as a color spec, so adding future flags may break parsing. Using `argparse` would make this more robust.
> - When `--colorize` is enabled, the script sets only background color; adding automatic contrasting foreground (as hinted in the commented section) would make the preview much more readable.