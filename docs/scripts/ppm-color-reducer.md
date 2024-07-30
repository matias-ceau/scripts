# ppm-color-reducer (ppm-color-reducer)

---

A program to reduce the color depth of PPM images using a specified color palette.

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

- A C compiler (such as `gcc`)
- Basic libraries for `stdio.h`, `stdlib.h`, `math.h`, `string.h`, and `limits.h`

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `ppm-color-reducer` program is designed to process PPM images and reduce their color depth according to a given color palette stored in a text file. The program reads an input PPM file, finds the closest color from the provided palette for each pixel, and writes a new PPM file with the reduced color depth.

The core idea is to minimize color variations by mapping each pixel in the input image to the nearest color in the specified palette. This is done using the squared Euclidean distance, ensuring that the algorithm efficiently determines the closest color.

The script defines a `Color` struct to represent colors in RGB format and uses an array to store the palette. The program also implements functions for reading the palette, computing color distances, and finding the closest color.

---

<a name="usage" />

#### Usage

To compile and run the program, use the following commands in your terminal:

```sh
gcc -o ppm-color-reducer ppm-color-reducer.c
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

- `<input_file.ppm>`: The path to the input PPM file you want to process.
- `<output_file.ppm>`: The path where the new PPM file with reduced colors will be saved.
- `<palette_file.txt>`: The path to a text file containing the color palette in `r,g,b` format.

The program expects the input arguments to be exactly three. If this is not the case, it will output a usage message.

<a name="examples" />

#### Examples

Here's how to use the script in practice:

1. First, create a palette file, e.g., `palette.txt`, with the following RGB values:
   ```
   255,0,0
   0,255,0
   0,0,255
   255,255,0
   ```

2. Run the program to reduce the color depth of an image:
   ```sh
   ./ppm-color-reducer input.ppm output.ppm palette.txt
   ```

In this example, `input.ppm` is your source image and `output.ppm` will be the new file with reduced colors.

---

<a name="notes" />

### Notes

- Ensure that the palette file follows the specified format and does not contain non-numeric entries.
- The input file must be in the P6 format; other PPM formats (such as P3) will not be processed correctly.
- The program currently supports a maximum palette size of 256 colors.

> **Critique**: 
> While the script is functional, it could benefit from error handling improvements, especially when reading input files or parsing input arguments. Additionally, a more user-friendly way to specify palette files could be implemented, such as allowing different formats or providing default palettes. Furthermore, including performance optimizations for larger images or palettes might enhance execution speed.