# ANSI Escape Code Cheatsheet

---

**ansi-cheatsheet.sh**: A script to display a comprehensive ANSI escape code cheatsheet using `bat`.

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration, used to format the output of the cheatsheet.

### Description

The `ansi-cheatsheet.sh` script provides a quick reference for ANSI escape codes, which are used to format text in terminal applications. This script outputs a nicely formatted document containing the following sections:

- **Text Formatting**: Common formatting options like bold, underline, and strikethrough.
- **Text Colors**: Lists of foreground and background colors with their respective codes.
- **Bright Colors**: Similar to text colors but includes bright variations.
- **Cursor Movement**: Codes for moving the cursor around the terminal.
- **Miscellaneous**: Additional codes for cursor visibility and position management.

The actual ANSI codes are presented using the escape sequence `\e`, but a note advises users to replace `\e` with `\x1b` or `\033` as needed for compatibility with their terminal emulator.

### Usage

To use the script, simply run it in your terminal. It can be executed with the standard bash command:

```bash
bash /home/matias/.scripts/ansi-cheatsheet.sh
```

Alternatively, if you want to bind it to a key in your window manager (like Qtile), you can assign a keybinding that runs the script. A potential GTK or terminal keybinding could look like this in your Qtile configuration:

```python
Key([mod], "c", lazy.spawn("bash /home/matias/.scripts/ansi-cheatsheet.sh"))
```

When run, the output will be colorful and formatted thanks to `bat`, aiding in quick reference and learning of ANSI escape codes.

---

> [!NOTE]  
> While this script is quite useful, it could be enhanced by allowing the user to output the cheatsheet in different formats (like plain text) or providing an option to query specific sections directly. Additionally, offering a way to redirect the output to a file could improve usability for future reference.