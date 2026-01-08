# Count tokens with tiktoken (stdin/file)

---

**count_tokens_with_tiktoken.py**: Count tokens for a text using tiktoken and an OpenAI model encoding

---

### Dependencies

- `uv` (runs the script with inline dependency metadata via the shebang)
- `python>=3.14`
- `tiktoken>=0.12.0` (tokenizer + model-specific encodings)

### Description

This script prints the number of tokens for a given input using `tiktoken`’s `encoding_for_model(model)`. It’s designed to fit nicely into a CLI workflow on Arch Linux and can be used in pipelines (stdin) or by pointing to a file.

Key behavior:

- **Default model**: `gpt-4o` (controls which encoding is used).
- **Input sources**:
  - If `-f <path>` is provided, the file content is tokenized.
  - Otherwise, the script reads from **stdin** (`sys.stdin.read()`), making it ideal for pipes.
- **Output format**: a single line: `nb_tokens\t<number>` (tab-separated), which is easy to parse with tools like `cut`, `awk`, or in qtile widgets/hooks.

Internally:
- `count_tokens(text, model)` resolves the encoding and encodes the whole text, returning `len(tokens)`.
- `get_options(argv)` implements minimal flag parsing for `-h`, `-f`, and `-m`.

### Usage

Pipe text:

    echo "Hello world" | /home/matias/.scripts/bin/count_tokens_with_tiktoken.py

Count tokens of a file:

    /home/matias/.scripts/bin/count_tokens_with_tiktoken.py -f ~/notes/prompt.txt

Select another model encoding:

    cat prompt.txt | /home/matias/.scripts/bin/count_tokens_with_tiktoken.py -m gpt-4.1

Show help:

    /home/matias/.scripts/bin/count_tokens_with_tiktoken.py -h

Suggested qtile use (example keybinding runs on current selection via xclip):

    xclip -o -selection clipboard | count_tokens_with_tiktoken.py

---

> [!TIP]
> The argument parsing is fragile: it joins argv into a string and searches for `" -m "` / `" -f "` which fails if flags are at the start/end or combined differently (e.g. `-m gpt-4o` at end). Consider `argparse` for robust parsing and proper `--help/--model/--file` long options. Also, `encoding_for_model()` can raise for unknown models—catch and print a friendly error (or fall back to `get_encoding("o200k_base")`).