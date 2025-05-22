# JSON to Markdown Converter

---

**json_to_markdown.py**: Converts a simple JSON file (list of dicts with "role" and "content") to a styled Markdown file.

---

### Dependencies

- `python` (tested on Python 3)
- Standard library modules only: `json`, `os`, `sys`

---

### Description

This script enables rapid conversion of structured dialogue data (stored in JSON files) into readable Markdown, using a minimal and direct approach. The expected JSON file format is a list of dictionaries, each with the keys `"role"` and `"content"`:
```json
[
  {"role": "user", "content": "Hello!"},
  {"role": "assistant", "content": "Hi there!"}
]
```

The script:
- Takes a path to a JSON file as a command-line argument.
- Reads the file and parses the content.
- Iterates over each entry, formatting it in Markdown:
    - Displays the role (capitalized) as a header in bold and prefixed with hashes.
    - Follows with an underline and the content.
    - Delimits entries with horizontal rules (___).
- Writes the Markdown output to a file in the same directory, with the same basename and `.md` extension.

---

### Usage

**Basic usage from terminal:**
```sh
python /home/matias/.scripts/bin/json_to_markdown.py <path_to_json_file>
```

**Example:**
```sh
python ~/.scripts/bin/json_to_markdown.py ~/my_dialogue.json
```
- If the input is `~/my_dialogue.json`, the result will be `~/my_dialogue.md`.

**Tip:**
- This script can be run from a qtile keybinding, or any launcher, as long as you pass the JSON file as the first argument.

---

> [!TIP]
> 
> - The script assumes that every entry in the JSON is a dictionary with `"role"` and `"content"` keys. If any item is missing these keys, it will crash with a `KeyError`. Consider adding a try-except block to handle malformed inputs gracefully.
> - There’s no command-line help (`-h`) or usage display, so running without arguments will throw an IndexError. Adding a usage message for missing/invalid arguments would improve robustness.
> - Activity is silent: no console output or progress. For complex jobs or scripting integration, consider printing the output filename or a completion message.
> - Scripts writes over existing `.md` files with the same name without warning.
> - The MarkDown format is simple but could be enhanced with optional arguments (e.g. custom templates, append mode, etc.) for future iterations.