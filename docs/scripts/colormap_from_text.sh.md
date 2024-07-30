# colormap_from_text.sh

---

Simple script that extracts color palettes from config files.

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

- Bash shell
- `grep` utility
- `sort` utility

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `colormap_from_text.sh` script is a Bash utility designed to extract color palettes specified in hexadecimal format from input files. It allows users to convert these hex colors into multiple formats, including RGB tuples and ANSI-style color outputs for terminal display. The script employs `grep` to find color codes and `sort` to ensure unique entries, enhancing usability for developers and designers who frequently work with color configurations.

Key functionalities include:
- Accepting command-line arguments to determine output format.
- Validating input to prevent incompatible options from being set.
- Generating output in hexadecimal, RGB, or a color block display as specified by the user.

---

<a name="usage" />

#### Usage

To run the script, simply call it from the terminal, optionally providing command-line arguments for the desired output format:

```bash
./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
```

- `-x` or `--hex-code`: Output color in hexadecimal format.
- `-r` or `--rgb`: Output color in RGB format (e.g., `rgb(255, 255, 255)`).
- `-c` or `--color`: Display the color as a colored block in the terminal.

**Note:** Only one of `-x` or `-r` can be specified, as they are mutually exclusive.

<a name="examples" />

#### Examples

1. Extract and display colors in hex format:
   ```bash
   cat config_file.txt | ./colormap_from_text.sh -x
   ```

2. Extract colors as RGB tuples:
   ```bash
   cat config_file.txt | ./colormap_from_text.sh -r
   ```

3. Display colors as blocks in the terminal:
   ```bash
   cat config_file.txt | ./colormap_from_text.sh -c
   ```

---

<a name="notes" />

### Notes

Ensure that the input file (e.g., config_file.txt) contains valid hexadecimal color codes for the script to function correctly. The script reads from standard input, making it versatile for use in pipelines or direct file output.

> **Critique:**  
> While the script is functional and provides essential error handling, it could benefit from additional features like accepting custom input files directly as arguments or providing a help option (`-h` or `--help`) that outputs usage instructions. Additionally, more robust error handling for input validation (checking if input is provided) could enhance user experience.