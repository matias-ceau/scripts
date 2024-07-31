# Token Counter with tiktoken

---

**[count_tokens_with_tiktoken.py](count_tokens_with_tiktoken.py)**: A Python script to count the number of tokens in a text file using tiktoken

---

### Dependencies

- `tiktoken`: A tokenizer for OpenAI models, providing functions for encoding and decoding text into tokens. Install via pip (`pip install tiktoken`).

### Description

The `count_tokens_with_tiktoken.py` script is designed to count the number of tokens in a given text file using the `tiktoken` library, which is specifically tailored for OpenAI's language models. Tokens are the basic units that these models use to process and generate text, making this script a valuable tool for understanding text length in a format that models comprehend.

The script includes the function `count_tokens(file_path)` that:
1. Reads the contents of the specified text file.
2. Encodes the text into tokens using the model "gpt-4o".
3. Returns the total number of tokens.

The script also handles command-line interaction, ensuring that the user provides the necessary file path.

### Usage

To use the script, follow these steps:

1. Make sure you have Python 3 and the necessary library installed:
   ```bash
   pip install tiktoken
   ```

2. Execute the script from the terminal by providing the path to the text file you want to analyze:
   ```bash
   python count_tokens_with_tiktoken.py <file_path>
   ```

   Replace `<file_path>` with the actual path to your text file.

   For example:
   ```bash
   python count_tokens_with_tiktoken.py /path/to/your/textfile.txt
   ```

   You will receive an output with the number of tokens used in the provided file:
   ```
   Number of tokens: 256
   ```

---

> [!TIP]  
> Consider adding input validation for the file path to handle cases where the provided file does not exist or is not readable. Additionally, expanding the script to accept multiple file paths as arguments would enhance its usability for batch processing.
