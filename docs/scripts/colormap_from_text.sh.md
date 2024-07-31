# Color Palette Extractor (colormap_from_text.sh)

---

Extracts unique color palettes from text files based on specified output formats.

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

- `grep`
- `sort`

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to extract unique hexadecimal color codes from text files and format them according to user specifications. It allows output in three formats: hexadecimal, RGB, or RGB with a colored background. The extraction process utilizes `grep` to find color codes in the format `#RRGGBB`, ensuring that only valid hex codes are processed.

The script begins by defining a usage function which indicates the proper syntax for executing the script. It accepts multiple command-line arguments to control the output format:

- `-x` or `--hex-code`: Outputs only the hex code.
- `-r` or `--rgb`: Outputs the RGB format.
- `-c` or `--color`: Outputs the RGB format along with a colored terminal background.

The script employs a loop to parse and validate input arguments and ensures that only one of the color output options can be selected at a time.

---

<a name="usage" />

#### Usage

To run the script, use the following command format:

```bash
./colormap_from_text.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
```

You can pipe a text file into the script like so:

```bash
cat myfile.txt | ./colormap_from_text.sh [options]
```

Replace `[options]` with one or more of the flags `-x`, `-r`, or `-c` to customize the output format as needed.

<a name="examples" />

#### Examples

1. To extract colors in hexadecimal format:
   ```bash
   cat myfile.txt | ./colormap_from_text.sh -x
   ```

2. To extract colors in RGB format:
   ```bash
   cat myfile.txt | ./colormap_from_text.sh -r
   ```

3. To output colors with both RGB values and colored background:
   ```bash
   cat myfile.txt | ./colormap_from_text.sh -c
   ```

---

<a name="notes" />

### Notes

- Ensure that the input file contains valid hexadecimal color codes for effective extraction.
- The script outputs the RGB values in the format `rgb(r, g, b)` for the `-r` option.

> **Critique**: 
> The script does not handle cases where input may not be piped directly into it; it could be improved by adding a mechanism to read from a specified file as an argument instead of requiring a pipe. Additionally, incorporating error handling for empty inputs or invalid formats would enhance the user experience and reliability.