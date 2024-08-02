#! /usr/bin/env python

import sys
import os
import argparse
from ollama import Client

def read_script(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def describe_script(script_content):
    client = Client()
    prompt = f"Please describe the following script and its functionality:\n\n{script_content}"
    
    response = client.generate(model='llama3.1', prompt=prompt)
    
    return response['response']

def main():
    parser = argparse.ArgumentParser(description="Describe a script using Llama 3.1 model.")
    parser.add_argument("script_path", help="Path to the script file (relative or absolute)")
    args = parser.parse_args()

    script_path = os.path.abspath(args.script_path)
    
    if not os.path.exists(script_path):
        print(f"Error: The file '{script_path}' does not exist.")
        sys.exit(1)

    script_content = read_script(script_path)
    description = describe_script(script_content)

    print(f"Description of '{script_path}':")
    print(description)

if __name__ == "__main__":
    main()
