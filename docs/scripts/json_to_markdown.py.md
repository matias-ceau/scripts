# JSON to Markdown Converter

---

**json_to_markdown.py**: Converts JSON content into a formatted Markdown file.

---

### Dependencies

- `python`: The script requires Python to run. Ensure that Python is installed on your Arch Linux system.

### Description

The `json_to_markdown.py` script provides a simple utility for converting JSON files into formatted Markdown documents. The conversion is facilitated through the `json` module from Python's standard library. 

#### Script Functionality

1. **Reading the JSON File**: The script reads a JSON file specified as a command-line argument. It expects the JSON structure to contain an array of objects, each with a `"role"` and `"content"` field.
   
2. **Formatting to Markdown**: The script converts each entry to Markdown format:
   - Each entry's role is capitalized and placed as a header.
   - The content is added below the header, separated by horizontal lines.
   
3. **Output Filename**: The output Markdown file is named based on the input JSON filename, replacing `.json` with `.md`.

### Usage

To use the script, execute it from the terminal with the path to your JSON file as the argument. Here's how you can run it:

```bash
python /home/matias/.scripts/json_to_markdown.py path/to/your_file.json
```

### Example:

If your JSON file (`example.json`) looks like this:

```json
[
    {"role": "intro", "content": "This is an introduction."},
    {"role": "conclusion", "content": "This is a conclusion."}
]
```

Running the script:

```bash
python /home/matias/.scripts/json_to_markdown.py example.json
```

Will produce a file named `example.md` with the following content:

```
___
# **Intro:**

___

This is an introduction.

___
# **Conclusion:**

___

This is a conclusion.
```

---

> [!TIP]  
> The script could improve error handling, such as checking if the provided file exists or if the JSON structure is valid before attempting to read and transform it. Additionally, implementing an option to customize Markdown formatting could enhance its usability for various purposes.