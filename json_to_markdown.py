#!/usr/bin/python

import json
import os
import sys


def json_to_markdown(json_file):
    with open(json_file, "r") as file:
        data = json.load(file)

    markdown = ""
    for entry in data:
        role = entry["role"].capitalize()
        content = entry["content"]
        markdown += f"___\n# **{role}:**\n\n___\n\n{content}\n\n"

    return markdown


if __name__ == "__main__":
    json_file = os.path.abspath(os.path.expanduser(os.path.expandvars(sys.argv[1])))
    markdown_output = json_to_markdown(json_file)
    filename = (
        json_file.replace(".json", ".md")
        if json_file.endswith(".json")
        else json_file + ".md"
    )
    with open(filename, "w") as md_file:
        md_file.write(markdown_output)
