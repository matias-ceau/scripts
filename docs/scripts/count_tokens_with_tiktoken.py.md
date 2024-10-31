# Token Counter with TikToken

---

**count_tokens_with_tiktoken.py**: Script to count tokens in text using the TikToken library for specific NLP models.

---

### Dependencies

- `tiktoken`: Library to handle tokenization for different language models.
- `sys`: Used for handling command-line arguments and interacting with standard input.

### Description

This script is designed to count the number of tokens in a given piece of text, utilizing the `tiktoken` library. Tokens are fundamental elements of text that NLP models process, and this script provides a simple way to calculate them for different models, with a default to "gpt-4o".

- **count_tokens(text, model)**: Encodes the input text into tokens for a specified model and returns the token count.
- **get_options(arguments)**: Processes command-line arguments to determine the input text or file and the model to be used.
- **usage(exit_code)**: Displays usage information and exits the script with the provided code.

### Usage

You can use this script in two primary ways:

1. **Pipe Input**: 
   ```bash
   echo 'Sample text for token counting.' | ./count_tokens_with_tiktoken.py
   ```

2. **File Input**: 
   ```bash
   ./count_tokens_with_tiktoken.py -f /path/to/textfile.txt
   ```

Options:
- `-h`: Display help information.
- `-m <model>`: Specify the NLP model to be used (default is "gpt-4o").

Assign this script to a keybinding in your qtile window manager for quick access or run it in a terminal session to check token counts interactively.

---

> [!TIP]
> The script currently defaults to the "gpt-4o" model. It would be beneficial to add checks to ensure the specified model is supported by `tiktoken` to avoid runtime errors. Additionally, improved error handling for cases where the specified file cannot be found could make the script more robust.