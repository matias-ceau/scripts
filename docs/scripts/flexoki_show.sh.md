# Flexoki Color Palette Preview

---

**flexoki_show.sh**: Script to visually display the Flexoki color palette and roles in your terminal

---

### Dependencies

- `bash` – Standard shell for script execution.
- A truecolor-compatible terminal (e.g., `alacritty`, `kitty`, `gnome-terminal`, etc.)  
  *Required to properly display 24-bit colors with ANSI escape codes.*
- (Optional) `echo` with `-e` support – Most modern shells complete this requirement.

### Description

This script, `flexoki_show.sh`, prints a formatted table to your terminal that visually previews the Flexoki palette (HEX/RGB values), associated color roles, and UI/syntax information.

- **Each line** defines a Flexoki color (e.g., reds, oranges, base colors, etc.).
- **ANSI escape sequences (`\e[38;2;R;G;Bm`)** are used for truecolor output, allowing you to view **real color swatches** directly within your terminal.
- **Columns include:**  
    - HEX code  
    - RGB value  
    - Color name and "short" alias  
    - UI mapping and syntax hint  
    - A colored block visually representing the color  
- Italics and reversed backgrounds/style are also used for visual cues, e.g., to mark certain color roles.

Typical use cases:
- Quick reference for Flexoki color assignment when theming Qtile, status bars, or Neovim.
- Visual confirmation of color mapping for custom scripts or theme development.

### Usage

You can:
- Run it directly from your terminal:
    ```
    ~/.scripts/bin/flexoki_show.sh
    ```
    or (if not exported to `$PATH`):
    ```
    bash /home/matias/.scripts/bin/flexoki_show.sh
    ```

- **Bind to a Qtile key:**
    In your `~/.config/qtile/config.py`, add a keybinding such as:
    ```python
    Key([mod], "F7", lazy.spawn("alacritty -e ~/.scripts/bin/flexoki_show.sh"))
    ```
    Replace `alacritty` with your preferred terminal.

- Pipe or redirect output if you want a raw text (though you’ll lose color formatting):
    ```
    ~/.scripts/bin/flexoki_show.sh > colors.txt
    ```

---

> [!TIP]
> - The script is robust for its intended visual role with Bash, but:
>   - **Readability**: Column alignment is unequal because the formatted color blocks and escape codes cause uneven spacing in different terminals. For best results, use a monospace font and ensure your terminal supports full ANSI/UTF-8 rendering.
>   - **Portability**: Use of `echo -e` with ANSI and Unicode blocks works on modern shells but can be inconsistent across older systems or with different versions of `echo`. For maximum portability and alignment, consider using `printf` instead of `echo -e`.
>   - **Enhancement**: If you plan on scripting or theming more, you may want to add flags (e.g., `--short`, `--ui`, `--hex-only`) or allow export in JSON/CSV/YAML formats for tooling and automation.
>   - **Performance**: Not an issue here due to the static nature of the script.
>   - **Documentation**: The on-screen legend is helpful, but adding in-script comments or usage (`--help` output) could be considered.