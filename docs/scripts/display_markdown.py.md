# Display Markdown in Rich Panel

---

**display_markdown.py**: Displays Markdown content in a rich console panel.

---

### Dependencies

- `rich`: A Python library for rich text and beautiful formatting in the terminal. Ensure to install this library using pip: `pip install rich`.

### Description

This script is designed to read and display Markdown files in a visually appealing manner using the `rich` library. The content is presented within a panel that features rounded corners and a customizable width. By default, the Markdown content is styled to resemble GitHub’s dark theme, enhancing readability.

The script achieves the following:

1. **Command-line Argument Handling**: It requires a single argument that is the path to the Markdown file to be displayed. If the optional second argument is provided and is numeric, it will set the width of the panel.
2. **Error Handling**: It gracefully handles errors such as:
   - File not found
   - Issues in reading the file, displaying helpful messages to the user.
3. **Markdown Rendering**: Utilizes the `Markdown` class from `rich` to convert the Markdown text into rich formatted output.

### Usage

To use the script, follow these steps:

1. Ensure you have the `rich` library installed.
2. Run the script from a terminal with the following command:

```bash
python display_markdown.py <path_to_markdown_file> [panel_width]
```

- **`<path_to_markdown_file>`**: The path to the Markdown file you wish to display.
- **`[panel_width]`**: (Optional) An integer to specify the width of the panel.

**Examples**:

- Display a Markdown file with default settings:

```bash
python display_markdown.py notes.md
```

- Display a Markdown file with a specific panel width:

```bash
python display_markdown.py notes.md 80
```

---

> [!TIP]  
> The script currently only checks for two command-line arguments, but it should ideally check if just one argument is provided before attempting to access `sys.argv[2]`. Additionally, it would benefit from better input validation on the panel width to ensure it is within a sensible range, preventing potential issues with overly large panels.