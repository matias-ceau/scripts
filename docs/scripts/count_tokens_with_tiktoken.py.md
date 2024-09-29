# Count Tokens with Tiktoken

---

**count_tokens_with_tiktoken.py**: A script to count tokens in a given text or file using Tiktoken.

---

### Dependencies

- `tiktoken`: A Python library for counting tokens in text. Ensure it is installed via pip (`pip install tiktoken`).

### Description

This script provides a straightforward way to count the number of tokens in a given text using the Tiktoken library. Tokens are crucial for understanding how models like GPT interpret input, and this script facilitates that by using different models to encode the input text.

#### Key Functions:

- **count_tokens(text, model)**: Encodes the provided text using the specified model to count the number of tokens.
  
- **get_options(arguments)**: Parses command-line arguments to determine if the user wants to input text directly, read from a file, or specify a token model.

- **usage(exit_code)**: Displays the usage information for the script, including options for help, model selection, and file input.

- **main(arg)**: Main execution flow that processes input and counts tokens, ultimately printing out the result.

### Usage

To utilize the script effectively, you can run it with command-line arguments, or pipe the text input directly into it.

#### Command-Line Examples:

1. **Count tokens from standard input:**
   ```bash
   echo "Your text here" | ./count_tokens_with_tiktoken.py
   ```

2. **Count tokens from a specific file:**
   ```bash
   ./count_tokens_with_tiktoken.py -f path/to/your/file.txt
   ```

3. **Specify a model (default is `gpt-4o`):**
   ```bash
   ./count_tokens_with_tiktoken.py -m gpt-3.5-turbo -f path/to/your/file.txt
   ```

#### Help Option:
For detailed usage information, run:
```bash
./count_tokens_with_tiktoken.py -h
```

---

> [!TIP]  
> While the script is functional, improvements could be made regarding error handling, especially when dealing with file inputs. For instance, you might want to handle cases where the file does not exist or cannot be opened. Additionally, consider adding support for multiple input files or richer output formatting to better inform users.