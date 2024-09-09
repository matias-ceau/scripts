# Display Markdown in Terminal

---

**display_markdown.py**: Renders Markdown files in the terminal using Rich.

---

### Dependencies

- `rich`: A Python library for rendering rich text and beautiful formatting in the terminal.

### Description

The `display_markdown.py` script allows users to view Markdown files directly in their terminal with a visually appealing format. It utilizes the `rich` library, which provides advanced features for formatting and displaying content in the terminal, including colors, styles, and layouts.

When executed, the script first checks for the correct number of command-line arguments. It expects one argument, which should be the path to a Markdown file. If the argument is not provided, or if there are issues opening or reading the file, appropriate error messages are displayed.

Once the Markdown content is successfully read, it is rendered in a styled panel. The panel uses a darker GitHub style for the text, providing a pleasant reading experience.

### Usage

To use the script, execute it from the terminal with a Markdown file as an argument:

```bash
python display_markdown.py <markdown_file>
```

For example, to display a Markdown file named `example.md`, you would use:

```bash
python display_markdown.py example.md
```

If the Markdown file is located in a different directory, ensure to provide the full path:

```bash
python display_markdown.py /path/to/your/markdown_file.md
```

In case of any errors (like file not being found), the script will print an error message indicating the issue in red text.

---

> [!TIP]  
> The script could be improved by adding more options for users, such as specifying different styling themes or scaling the panel size. Additionally, implementing a help command would improve usability for first-time users. Always consider handling more exceptions to cover potential edge cases with file handling.