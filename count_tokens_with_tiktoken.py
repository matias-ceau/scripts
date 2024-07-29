#! /usr/bin/env python

import sys
import tiktoken

def count_tokens(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()
    encoding = tiktoken.encoding_for_model("gpt-4o")
    tokens = encoding.encode(text)
    return len(tokens)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python count_tokens.py <file_path>")
        sys.exit(1)
    file_path = sys.argv[1]
    num_tokens = count_tokens(file_path)
    print(f"Number of tokens: {num_tokens}")
