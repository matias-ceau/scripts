# PPM Color Reducer (ppm-color-reducer)

---

This script reduces the colors in a PPM image using a specified color palette.

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

- C compiler (gcc or clang)
- PPM images in P6 format
- Color palette file in a comma-separated format (RGB)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The PPM Color Reducer reads an input PPM image and converts its colors to the closest match from a specified color palette. The script is designed to function with images in PPM format (specifically P6) and requires a palette to map the original colors to reduced set colors.

The core functionality is driven by comparing the color distances between the pixels in the input image and the colors defined in the palette, utilizing the Euclidean distance squared to determine proximity. If a color is not within the palette, it will be replaced by the nearest available option. 

The script starts by reading a palette file, processes the PPM image, and outputs a new reduced-color PPM file.

---

<a name="usage" />

#### Usage

Compile the script with a C compiler, for instance:

```bash
gcc -o ppm-color-reducer ppm-color-reducer.c -lm
```

To run the script, use the following command structure:

```bash
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

Where:
- `<input_file.ppm>` is the path to the input PPM image.
- `<output_file.ppm>` is the path where you want to save the output image with reduced colors.
- `<palette_file.txt>` is a text file containing the color palette in the format `R,G,B` on separate lines.

<a name="examples" />

#### Examples

Here are a few example usages of the script:

1. To convert an image `photo.ppm` to `photo_reduced.ppm` using a defined palette:

```bash
./ppm-color-reducer photo.ppm photo_reduced.ppm palette.txt
```

2. If the palette file contains the following colors:

```
255,0,0
0,255,0
0,0,255
255,255,0
```

The colors in `photo.ppm` will be reduced and converted based on the nearest match found in the palette.

---

<a name="notes" />

### Notes

- The input PPM file must be in P6 format; other formats such as P3 will not be processed correctly.
- The palette file should not contain comments or empty lines for correct parsing.
- Make sure the script has the appropriate permissions to read input files and write output files.

> **Critique**: The script lacks error handling for memory allocation and could be made more robust by checking for potential file read errors. The inclusion of support for different PPM formats (like P3) could also enhance its usability. Furthermore, consider expanding the palette loading to support hex color formats, which are more common in many design applications.