# Display Markdown

---

**display_markdown.py**: Script to display markdown files using the Rich library with customizable styles and width.

---

### Dependencies

- `rich`: This library is used to render beautiful formatting in the terminal, including markdown.

### Description

This script is designed to render markdown files in the terminal using the `Rich` library, enhancing the visual representation of markdown content with styles and panels. It takes a markdown file as input and displays its content with a default style (`github-dark`). The script utilizes panels to contain the markdown content, allowing the user to specify a width for the panel display.

Key functionalities include:
- **Markdown Display**: The use of `Rich.Markdown` to apply the `github-dark` style.
- **Error Handling**: The script checks for file existence and handles errors related to unauthorized access or missing files.
- **Customization**: Users can optionally specify a display width for the markdown panel.

### Usage

The script can be executed from the terminal and supports optional command-line arguments:

```bash
# Basic usage
python display_markdown.py path/to/markdown/file.md

# With specified panel width
python display_markdown.py path/to/markdown/file.md 80
```

The first argument is the path to the markdown file, and the second optional argument is the width of the panel for better control over display aesthetics.

---

> [!WARNING]
> The CLI argument handling has an issue. The script currently expects exactly two arguments to be provided even if the panel width is not required, which could be confusing. It would be improvements to implement separate logic for cases with one argument and handle the optional panel width correctly. Additionally, ensure exception handling is uniformly applied across all scenarios to prevent the script from crashing with unexpected inputs.