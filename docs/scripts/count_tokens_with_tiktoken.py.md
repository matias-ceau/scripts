# Count Tokens with Tiktoken

---

**count_tokens_with_tiktoken.py**: A Python script to count the number of tokens in a text file using the `tiktoken` library.

---

### Dependencies

- `tiktoken`: A library for encoding text to token counts specifically tailored for models like GPT. Ensure it's installed via `pip install tiktoken`.

### Description

This script is designed to count the number of tokens in a given text file using the `tiktoken` library, which provides tokenization capabilities specifically optimized for OpenAI's language models. 

The core functionality lies within the `count_tokens(file_path)` function, which:
1. Opens a specified text file and reads its content.
2. Utilizes the `tiktoken` library to encode the text based on the tokenization scheme for the "gpt-4o" model.
3. Returns the total number of tokens as an integer.

The script also includes a command-line interface to specify the text file for token counting. If the user does not provide exactly one argument, it prints usage instructions.

### Usage

To execute the script, navigate to the directory where the script is located and run the following command, replacing `<file_path>` with the path to the desired text file:

```bash
python count_tokens_with_tiktoken.py <file_path>
```

Example: To count tokens in a file named `example.txt`, you would use:

```bash
python count_tokens_with_tiktoken.py example.txt
```

The script will output the total number of tokens in the specified file:

```
Number of tokens: <num_tokens>
```

---

> [!TIP] 
> The script currently requires the file to be in UTF-8 encoding. Consider adding error handling for file reading to manage potential issues such as FileNotFound. Additionally, allowing the user to specify the model type might increase flexibility.