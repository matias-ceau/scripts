# Token Counter with Tiktoken

---

**count_tokens_with_tiktoken.py**: Script to count tokens using `tiktoken` with support for different models

---

### Dependencies

- `tiktoken`: A Python library for tokenization that supports various models used for language experiments and applications.

### Description

This script is designed for token counting, particularly useful for evaluating input size against language models like `gpt-4o`. Leveraging `tiktoken`, it determines how many tokens a given text contains by encoding the text according to the specified model's tokenization scheme. The script reads text either from a file or from standard input (stdin), defaulting to the model `gpt-4o` which can be overridden through the `-m` option.

The core functionality is encapsulated in two functions:
- `count_tokens(text, model)`: Encodes the given text to count its tokens.
- `get_options(arguments)`: Parses command-line arguments to determine if text should be read from a file and which model should be used.

The script also includes a `usage()` function to provide help and usage information.

### Usage

This script can be used in two primary ways:

1. **Pipeline with text input**:  
   ```bash
   <cmd> | ./count_tokens_with_tiktoken.py
   ```
   Replace `<cmd>` with any command that outputs text to be tokenized.

2. **File input**:
   ```bash
   ./count_tokens_with_tiktoken.py -f <file_path> [-m <model_name>]
   ```
   - `-f <file_path>`: Specify the path to a text file whose contents will be tokenized.
   - `-m <model_name>`: Optional; specify a model other than the default `gpt-4o`.

For help, use:
```bash
./count_tokens_with_tiktoken.py -h
```

---

> [!TIP]
> Consider clarifying the usage of models within the script, as users might need guidance on what model specifications are compatible. Also, ensure that when using `-f` and `-m`, there is proper error handling and informative error messages to guide users on incorrect inputs. Additionally, renaming `usage()` to `print_usage()` might enhance readability by making its purpose clearer.