# Count Tokens with tiktoken

---

**count_tokens_with_tiktoken.py**: Count token usage for a text file or stdin using OpenAI `tiktoken`.

---

### Dependencies

- `tiktoken`  
  Python package for OpenAI tokenizer encoding/decoding.  
- Python 3.x (interpreter)

### Description

This script counts the number of tokens (as understood by OpenAI's tokenization schemes) in a given text.  
It's designed to be used in two ways:

1. **Through a command line file argument**: supply a file with the `-f` flag to count tokens in its contents.
2. **Via stdin**: you can pipe text directly to it for interactive or scripted workflows.

The script defaults to the `gpt-4o` model for tokenization if no model is specified. The model can be changed using the `-m` flag.  
It parses arguments manually and gracefully provides usage help.

**Key Functions:**
- `count_tokens(text, model)`: returns token count using the specified model.
- `get_options(arguments)`: CLI argument parser, fetches file contents or reads from stdin, and selects the model.
- `usage()`: prints usage help and exits.

### Usage

Examples for Arch Linux + qtile environment:

```sh
# Pipe text and count tokens with default model (gpt-4o)
echo "Hello world!" | ~/.scripts/bin/count_tokens_with_tiktoken.py

# Count tokens in a file
~/.scripts/bin/count_tokens_with_tiktoken.py -f ~/long_document.txt

# Specify a different OpenAI model (e.g. gpt-3.5-turbo)
~/.scripts/bin/count_tokens_with_tiktoken.py -f ~/text.txt -m gpt-3.5-turbo

# Get help
~/.scripts/bin/count_tokens_with_tiktoken.py -h
```

You can assign this script to a keybinding in your qtile config, especially to process clipboard contents or selected files.

---

> [!TIP]
> - The argument parsing is simplistic and may break for input with overlapping or reordered flags, e.g. if `-m` is used before `-f`.
> - The usage string could show the full script name for clarity in help output.
> - There is no error handling for model names that are not recognized by `tiktoken`.
> - Consider using a standard argument parser like `argparse` or `click` for more robustness and flexibility.
> - Reading stdin is blocking; if nothing is piped, the script will wait for user input. An explicit prompt or timeout could improve interactivity.