# Flexoki palette preview (terminal)

---

**flexoki_show.sh**: Print a Flexoki color reference table with ANSI truecolor swatches

---

### Dependencies

- `bash`
- A terminal with **24-bit/truecolor** support (uses `\e[38;2;R;G;Bm`)

### Description

`flexoki_show.sh` is a tiny “palette cheat sheet” for the Flexoki theme: it prints a single table where each row shows:

- the **HEX** value
- an **RGB** tuple
- the **Flexoki name** (e.g. `red-600`, `base-200`)
- a **short tag** you can reuse mentally in configs (e.g. `re-2`, `bg-2`, `tx-2`)
- a couple of columns hinting at intended usage: **UI** indices (like `[1]`, `[7]`, `[15]`) and **SYNTAX** roles (error/warning/success, strings, numbers, comments, etc.)

Implementation-wise, everything is hardcoded in `line_generator()` and printed with `echo -e`. The swatch is a repeated Unicode block (`████████`) colored via ANSI escape sequences, and the script resets styling with `\e[0m`. Some rows are marked italic (`\e[3m`) and the header is reverse-video (`\e[7m`).

This is convenient on Arch/qtile setups when you’re tweaking terminal themes, editor highlight groups, or qtile widget colors and want a quick visual reference without opening a browser.

### Usage

Run directly in a terminal:

    ~/.scripts/bin/flexoki_show.sh

Pipe through a pager (keep raw control sequences):

    ~/.scripts/bin/flexoki_show.sh | less -R

Typical qtile keybinding idea (spawn in your terminal):

- bind a key to: `alacritty -e ~/.scripts/bin/flexoki_show.sh`  
  (swap `alacritty` with your terminal)

---

> [!TIP]
> Consider using `printf` instead of many `echo -e` calls (more portable/consistent), and optionally add flags like `--no-italics` / `--no-header` for terminals that render italics poorly. If you want this to be maintainable, storing the palette in an array (HEX/RGB/name/role) and generating rows in a loop would reduce duplication and make updates safer.