<template># llm-script-describer.py

---

A Python script to generate GitHub documentation for user scripts using OpenAI.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Python 3.x
- OpenAI Python client
- Colorama
- Other standard library modules

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `llm-script-describer.py` script automates the process of generating Markdown documentation for user-defined scripts based on a provided CSV file. The script utilizes OpenAI's GPT-4o-mini model to create descriptions and aids in maintaining a clean documentation structure for scripts stored on an Arch Linux environment with the qtile window manager. 

Key functions include:
- Reading script files and determining if they are binary or text.
- Generating documentation from script content using OpenAI’s API.
- Maintaining an index of files and checking for orphaned documentation.
- Updating the README file with a summary and a table of scripts.

---

<a name="usage" />

#### Usage

To use the script, you need to run it from the terminal, supplying the path to a CSV file as an argument. If no path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`. Before running, ensure the required OpenAI API key is set in the environment.

Example command:
```bash
./llm-script-describer.py /path/to/symlink_data.csv
```

Make sure you have the permissions to execute the script.

<a name="examples" />

#### Examples

1. Default usage with pre-defined CSV path:
```bash
./llm-script-describer.py
```

2. Specify a custom CSV file:
```bash
./llm-script-describer.py /home/matias/scripts/my_scripts.csv
```

---

<a name="notes" />

### Notes

- Ensure that all required dependencies are installed before executing the script.
- Orphaned documentation files are automatically checked and reported.
- The script maintains a persistent list of script metadata in a JSON format for further processing or updates.
  
> **Critique:** 
> While the script is functional, there are areas for improvement. For instance, the handling of errors during API calls could be more robust, potentially implementing retries. Moreover, the reliance on external file paths assumes a specific folder structure which might not be universally applicable. Adding configurations through command-line options could enhance its adaptability.