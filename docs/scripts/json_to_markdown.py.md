# JSON to Markdown Converter

---

**json_to_markdown.py**: Convert JSON content to a formatted markdown file.

---

### Dependencies

- `python`: The script is written in Python and requires a Python interpreter to run.
- `json`: A built-in Python module for JSON parsing.
- `os` and `sys`: Python modules used for file path management and accessing command-line arguments.

### Description

This script reads a JSON file and converts its contents into a markdown formatted document. The JSON is expected to have entries with `"role"` and `"content"` keys. Each entry becomes a section in the markdown file, where the `"role"` is capitalized and used as a heading and the `"content"` is included under it. The sections in the markdown are separated by lines of underscores.

Key parts of the script:
- The `json_to_markdown` function handles the conversion from JSON to markdown format.
- It reads the JSON file, interprets the data, and compiles it into a markdown string, structuring each JSON entry into separate markdown sections.
- In the main block, the script takes a file path as a command-line argument, converts the file, and writes the output to a new markdown file with a `.md` extension.

### Usage

To use this script, execute it from the command line with the path to the JSON file as an argument:

```bash
python /home/matias/.scripts/bin/json_to_markdown.py /path/to/input.json
```

This will generate a new file, replacing the `.json` extension with `.md` (if the file has a `.json` extension), or appending `.md` otherwise, in the same directory:

```bash
# Output example:
# /path/to/input.md
```

---

> [!TIP] It's important to check the JSON file format before running the script, ensuring each entry contains "role" and "content". Additionally, the script lacks error-handling mechanisms for potential file reading/writing issues or JSON parsing errors. Implementing exception handling would improve its robustness, especially in scenarios where the file does not exist or doesn't comply with the expected JSON structure.