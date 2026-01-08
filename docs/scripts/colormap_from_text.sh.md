# Colormap From Text

---

**colormap_from_text.sh**: Extract unique hex colors from text and print as RGB/hex (optionally previewed)

---

### Dependencies

- `bash`
- `grep` (uses `-oE` to extract `#[0-9a-fA-F]{6}`)
- `sort` (deduplicates via `sort -u`)
- `cat` (when reading from files)
- `bat` (used to render the help output with `bat -plhelp`)

### Description

`colormap_from_text.sh` scans input text (either stdin or one/multiple files) for 6-digit hex colors (`#RRGGBB`). It deduplicates them and converts each color to either:

- raw RGB triplets: `r, g, b` (default)
- CSS-style: `rgb(r, g, b)` via `-r/--rgb`
- original hex: `#RRGGBB` via `-x/--hex-code`

With `-c/--color`, it also prints a terminal color swatch using truecolor escape sequences (`\e[48;2;R;G;Bm ... \e[0m`), which is useful when iterating on qtile themes, rofi configs, alacritty/kitty themes, etc.

Notes on flow:

- When stdin is piped, it processes that stream directly.
- When run without a pipe, it expects one or more file paths; it `cat`s them into the same pipeline.

### Usage

Pipe from any command:

    cat ~/.config/qtile/config.py | colormap_from_text.sh
    rg '#[0-9a-fA-F]{6}' -n ~/.config -S | colormap_from_text.sh -r
    cat theme.conf | colormap_from_text.sh -x

Read one or more files:

    colormap_from_text.sh ~/.config/qtile/config.py
    colormap_from_text.sh -c -r ~/.config/alacritty/alacritty.yml ~/.Xresources

Preview swatches (good for quick visual palette checks):

    colormap_from_text.sh -c ~/.config/qtile/config.py
    cat colors.ini | colormap_from_text.sh -c -x

---

> [!TIP]
> Improvements to consider:
> - The help text suggests “`<stdout> | script`” but mentions `<file(s)>` while the parser currently treats any non-option as a file; adding `--` support (end of options) would avoid edge cases with filenames starting with `-`.
> - `usage()` always exits with `1`; use `0` for `-h/--help` and `1` for errors.
> - Add support for 3/8-digit hex (`#RGB`, `#RRGGBBAA`) if you ever parse web/CSS-heavy configs.
> - `bat` is optional; consider falling back to `cat` if `bat` isn’t installed.