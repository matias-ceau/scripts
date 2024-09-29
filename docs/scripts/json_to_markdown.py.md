# Convert JSON to Markdown

---

**json_to_markdown.py**: A script to convert JSON files into Markdown format.

---

### Dependencies

- `json`: A standard library for parsing JSON data, included with Python.
- `os`: A standard library for interacting with the operating system, also part of Python.
- `sys`: A standard library for accessing command-line arguments and system-specific parameters, included with Python.

### Description

This script provides a straightforward utility to convert JSON files into nicely formatted Markdown files. It reads a JSON file passed as a command-line argument, processes its content, and generates an output Markdown file with the same base name.

The JSON structure expected by the script should be an array of objects, where each object contains at least two properties: `role` and `content`. The script capitalizes the `role` and formats the output in Markdown style. Each entry in the Markdown file is separated by horizontal lines, creating a clear distinction between different sections.

The script saves the Markdown output in a new file, with the same name as the input JSON file but with a `.md` extension.

### Usage

To use the script, you must provide the path to the JSON file as a command-line argument. Here's a basic example of how to execute it:

```bash
python /home/matias/.scripts/json_to_markdown.py /path/to/your/file.json
```

After running the script, a new Markdown file will be created in the same directory as the original JSON file. The name of the generated Markdown file will be the same as the JSON file but with a `.md` suffix.

For instance, if your input JSON file is named `example.json`, the output will be `example.md`.

---

> [!TIP]  
> The script currently does not handle errors, such as file reading issues or invalid JSON formats. Adding exception handling would make it more robust. Consider implementing checks to ensure that the input file exists and, if possible, validate the structure of the JSON data before attempting to process it.