# JSON to Markdown Converter

---

**json_to_markdown.py**: Convert JSON files to formatted Markdown documents

---

### Dependencies

- `python`: This script requires Python to run, specifically making use of the `json`, `os`, and `sys` modules which are part of the standard library.

### Description

This script, `json_to_markdown.py`, is designed to convert JSON files into Markdown format. It reads a JSON file containing structured data, where each entry is expected to have a "role" and "content". The "role" is capitalized and used as a header in the Markdown output, and the "content" is the body of each entry in the Markdown.

The script constructs a Markdown document by iterating over each entry in the JSON data, formatting it with an underscore line and a bold header for each role, followed by the content. It then saves the Markdown output into a file, either replacing the `.json` extension with `.md` or appending `.md` if the original file did not have a `.json` extension.

### Usage

To use this script, you need to call it with the path to a JSON file as a command-line argument. The script will process the JSON file and save the converted Markdown file in the same directory.

```bash
python /home/matias/.scripts/json_to_markdown.py path/to/input.json

# Example usage
python /home/matias/.scripts/json_to_markdown.py ~/documents/example.json
```

After running the script, you will find a new Markdown file named `example.md` in the same directory as `example.json`.

---

> [!TIP]
> The script currently assumes that every entry in the JSON file has both "role" and "content" keys. Adding error handling for potential KeyError exceptions would enhance its robustness. Additionally, it could be improved by allowing input to be read directly from standard input (stdin) if no file argument is provided, making it more flexible for use in pipelines.