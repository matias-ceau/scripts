# ANSI Escape Code Cheatsheet

---

**ansi-cheatsheet.sh**: Generate a comprehensive ANSI escape code cheatsheet.

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration, which is used to render the cheatsheet in a visually appealing way.

### Description

This script, `ansi-cheatsheet.sh`, generates a formatted cheatsheet for ANSI escape codes which are widely used in terminal applications to control text formatting and color. When executed, it utilizes the `bat` command to display a structured overview of various ANSI escape codes, including:

- **Text Formatting Codes**: These codes allow the user to modify the appearance of text (e.g., bold or italic).
- **Text Color Codes**: This section provides codes for setting foreground and background colors, covering the standard and bright color sets.
- **Cursor Movement Codes**: Codes for moving the cursor within the terminal can also be found here.
- **Miscellaneous Codes**: Additional functionalities such as hiding the cursor and saving/restoring cursor position.

Each section is clearly delineated and lists both the escape sequence and its effect, ensuring that users can easily understand and utilize these codes in their terminal applications.

### Usage

To use this script, simply run it in your terminal. It does not require any arguments:

```bash
bash /home/matias/.scripts/ansi-cheatsheet.sh
```

When you execute the script, a well-formatted cheatsheet will be displayed, showcasing the various ANSI codes and their respective descriptions. 

This script can also be assigned to a keybinding within your window manager (qtile) for quick access, allowing for efficient reference whenever you need to use ANSI codes.

---

> [!TIP] 
> While the script serves its purpose well, consider adding more interactive functionalities, such as allowing the user to customize the format or colors of the output. Additionally, providing a way to copy specific codes directly from the displayed cheatsheet could enhance usability. Lastly, ensure the script is executable by running `chmod +x /home/matias/.scripts/ansi-cheatsheet.sh`.