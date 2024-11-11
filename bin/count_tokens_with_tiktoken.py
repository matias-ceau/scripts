#!/usr/bin/env python

import sys

import tiktoken


def count_tokens(text, model):
    encoding = tiktoken.encoding_for_model(model)
    tokens = encoding.encode(text)
    return len(tokens)


def get_options(arguments):
    text, model = None, "gpt-4o"
    if len(arguments) != 1:
        arguments = " ".join(arguments[1:])
        if " -h " in arguments:
            usage(0)
        if " -f " in arguments:
            try:
                file_path = arguments.split("-f")[-1].split(" -")[0].strip()
                with open(file_path, "r") as f:
                    text = f.read()
            except IndexError:
                usage(1)
        if " -m " in arguments:
            try:
                model = arguments.split("-m")[-1].split(" -")[0].strip()
            except IndexError:
                usage(1)
    return text, model


def usage(exit_code=1):
    USAGE = """\
Usage:
    <cmd> | ./count_tokens.py 
    ./count_tokens_with_tiktoken.py -f <file_path>

Options:
    -h -- help
    -m -- model (default: gpt-4o)
"""
    print(USAGE)
    sys.exit(exit_code)


def main(arg):
    text, model = get_options(arg)
    text = text if text else sys.stdin.read()
    num_tokens = count_tokens(text, model)
    print(f"nb_tokens\t{num_tokens}")


if __name__ == "__main__":
    main(sys.argv)
