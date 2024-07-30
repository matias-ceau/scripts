# ppm-color-reducer

# PPM Image Color Quantization Script

This repository contains a C script that performs color quantization on PPM (P6 format) images using a predefined color palette. The script reads an image, matches each pixel to the closest color from the palette, and writes the result to an output file. 

## Table of Contents
- [Features](#features)
- [Usage](#usage)
- [Detailed Description](#detailed-description)
- [Functions](#functions)
- [Building](#building)

## Features
- Reads a palette of colors from a text file.
- Processes PPM (P6) formatted images.
- Matches each pixel in the input image to the closest color in the palette.
- Writes the quantized image to an output PPM file.

## Usage

### Command Line Syntax

```
./color_quantize <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

### Arguments

- `input_file.ppm`: Path to the input PPM image file.
- `output_file.ppm`: Path to save the quantized output PPM image.
- `palette_file.txt`: Path to the text file containing the color palette.

### Example

```sh
./color_quantize input.ppm output.ppm palette.txt
```

## Detailed Description

This script performs color quantization by taking a PPM image as input and converting its colors to the closest colors from a predefined palette. The palette is loaded from a text file where each line represents a color with comma-separated `R`, `G`, and `B` values. The output image is saved in PPM (P6) format.

## Functions

### `int color_distance_sq(Color c1, Color c2)`
Calculates the squared Euclidean distance between two colors.

**Arguments:**
- `Color c1`: The first color.
- `Color c2`: The second color.

**Returns:**
- The squared Euclidean distance between `c1` and `c2`.

### `Color find_closest_color(Color input)`
Finds the closest color in the palette to the input color.

**Arguments:**
- `Color input`: The input color.

**Returns:**
- The closest color from the palette.

### `int read_palette(const char *filename)`
Reads the color palette from a file.

**Arguments:**
- `const char *filename`: The path to the palette file.

**Returns:**
- `1` if the palette was successfully loaded, `0` otherwise.

### `int main(int argc, char *argv[])`
Main function to process command line arguments and perform the color quantization.

**Arguments:**
- `int argc`: Argument count.
- `char *argv[]`: Array of command line arguments.

## Building

To compile the script, use a C compiler like `gcc`. 

### Command

```sh
gcc -o color_quantize script.c -lm
```

- `-lm`: Links the math library.

### Notes

- Ensure that the input PPM image is in the P6 format.
- The palette file should contain colors in the format: `R,G,B` (one per line).

### Example Palette File (palette.txt)

```txt
# Example palette file
255,0,0
0,255,0
0,0,255
127,127,127
# Each line represents a color
```

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

Feel free to contribute or raise issues for improvements or bugs. Thank you for using this script!