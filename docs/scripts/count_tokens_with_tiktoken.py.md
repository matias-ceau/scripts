# Count Tokens with Tiktoken

---

**count_tokens_with_tiktoken.py**: Script to count the number of tokens in a text using the Tiktoken library.

---

### Dependencies

- `tiktoken`: A library for tokenizing text, particularly useful for pre-processing text for models like GPT. Make sure to install it via pip or your package manager.

### Description

This script is designed to count the number of tokens in a given text according to the specific model you choose. It utilizes the `tiktoken` library to perform the encoding, which converts the input text into tokens. The script can operate on text provided via standard input, a file, or a hard-coded string, making it versatile for different use cases.

The core functionalities of the script include:

- **count_tokens(text, model)**: This function takes a string of text and a model name, retrieves the appropriate encoding, and returns the count of tokens for that text.
- **get_options(arguments)**: This function processes command-line arguments to fetch the text input from either a file or standard input and allows the user to specify the model being used.
- **usage(exit_code)**: It prints the help message with usage instructions and exits the program.
- **main(arg)**: This function orchestrates the script's flow, handling input and output.

### Usage

You can use the script interactively in the terminal or through piping. Here's how you can use it:

1. To count tokens from standard input:
   ```bash
   echo "Your text goes here" | ./count_tokens_with_tiktoken.py
   ```

2. To count tokens from a file:
   ```bash
   ./count_tokens_with_tiktoken.py -f /path/to/your/file.txt
   ```

3. To specify a different model:
   ```bash
   echo "Your text goes here" | ./count_tokens_with_tiktoken.py -m gpt-3
   ```

4. To see the help message:
   ```bash
   ./count_tokens_with_tiktoken.py -h
   ```

---

> [!TIP] 
> This script assumes that proper error handling is in place for the input text and file reading. Consider adding more robust exception handling, especially for file operations and input validation. Additionally, you may want to standardize the command-line argument parsing to utilize libraries like `argparse` for better flexibility and usability.
