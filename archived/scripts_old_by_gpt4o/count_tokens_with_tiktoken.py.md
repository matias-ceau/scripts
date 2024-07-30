# count_tokens_with_tiktoken.py

# Token Counter Script

This script counts the number of tokens in a given text file using the GPT-4o model's tokenizer provided by the `tiktoken` library.

## Requirements

- Python 3.x
- `tiktoken` Python library

## Installation

First, ensure you have Python 3 installed. Then, install the `tiktoken` library using pip:

```sh
pip install tiktoken
```

## Usage

To run the script, use the following command:

```sh
python count_tokens.py <file_path>
```

Replace `<file_path>` with the path to the text file you want to analyze.

### Example

```sh
python count_tokens.py example.txt
```

## Script Walkthrough

### Function: `count_tokens(file_path)`

This function reads the text from the specified file and encodes it using the tokenizer of the "gpt-4o" model. It returns the length of the token list.

- **Parameters**:
  - `file_path` (str): The path to the text file to tokenize.

- **Returns**:
  - `int`: The number of tokens in the text file.

### Main Code Execution

1. **Argument Check**: The script expects exactly one command-line argument representing the file path.
2. **Token Count**: It calls the `count_tokens` function with the specified file path.
3. **Output**: Finally, it prints the number of tokens found in the file.

### Error Handling

- If no file path or more than one argument is provided, the script prints the usage information and exits with an error status.

## Example Output

```
Number of tokens: 125
```

The above output indicates that the text file contains 125 tokens according to the "gpt-4o" model's tokenizer.

## Author

This script was authored by the developer community. Further modifications and contributions are welcome.

## License

This script is available under the MIT License. See the LICENSE file for more details.