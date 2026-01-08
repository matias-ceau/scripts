# JSON → Markdown Converter

---

**json_to_markdown.py**: Convert a chat-like JSON array into a simple Markdown transcript

---

### Dependencies

- `python` (Arch package: `python`)
- `json` (Python standard library)
- `os` (Python standard library)
- `sys` (Python standard library)

### Description

`json_to_markdown.py` turns a JSON file containing a list of objects into a Markdown file meant to read like a conversation log.

Expected input structure (per element in the top-level array):

- `role`: a string (e.g. `"user"`, `"assistant"`) — it will be capitalized in output
- `content`: the message body (string)

For each entry, the script appends a Markdown “section” separated by horizontal rules and a heading:

- `___`
- `# **Role:**`
- message content

The output filename is derived from the input:
- If the input ends with `.json`, it replaces it with `.md`
- Otherwise, it appends `.md`

It also expands `~` and environment variables and converts the path to an absolute path, which fits nicely with your Arch + qtile workflow (can be called from keybindings, launchers, or hooks without worrying about relative paths).

### Usage

Run from a terminal (or from qtile via `lazy.spawn`):

    ./json_to_markdown.py ~/path/to/chat.json

If the file is not named `.json`, it still works:

    ./json_to_markdown.py /tmp/session_export
    # writes /tmp/session_export.md

Example input snippet:

    [
      {"role": "user", "content": "Hello"},
      {"role": "assistant", "content": "Hi!"}
    ]

Result: `chat.md` in the same directory as the input.

---

> [!TIP]
> Improvements to consider:
> - Add basic argument validation: running without `sys.argv[1]` currently raises `IndexError`.
> - Guard against missing keys (`role`/`content`) to avoid `KeyError`, or provide defaults.
> - Use `argparse` for `-o/--output` and stdin support, which is handy when piping exports.
> - Consider using `---` or Markdown headings without bold for cleaner rendering; `___` can be interpreted as a horizontal rule but may be inconsistent across renderers.
> - Preserve newlines/formatting in `content` (currently it’s written raw; that’s good, but you might want to ensure it ends with a newline consistently).