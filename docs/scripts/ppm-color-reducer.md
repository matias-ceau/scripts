# PPM Color Reducer

---

**ppm-color-reducer**: A script to reduce the color palette of a PPM image using a custom palette file.

---

### Dependencies

- `gcc`: Required to compile the C program.
- PPM image files: The script specifically processes and outputs PPM format files (P6 variant).
- A text file containing the color palette in RGB format.

### Description

The `ppm-color-reducer` is a C program designed to process PPM image files, specifically the P6 format, and reduce their color palette based on a provided palette file. This palette file should contain RGB values on each line, formatted as `R,G,B`. When executed, the program loads these colors into a palette and examines each pixel in the input PPM file. For each pixel, it calculates the Euclidean distance squared to find the closest matching color in the palette, effectively reducing the number of colors used in the output image.

Key components of the script:

- **Color Distance Calculation**: Uses squared Euclidean distance for performance efficiency to find the closest color match.
- **Palette Loading**: Parses an external file for color data, skipping comments and non-valid lines.
- **PPM Support**: Only supports P6 format, one of the binary PPM formats.

### Usage

To use this script, ensure it is compiled and accessible. The expected usage pattern is:

```bash
gcc -o ppm-color-reducer ppm-color-reducer.c

./ppm-color-reducer input_file.ppm output_file.ppm palette_file.txt
```

- **input_file.ppm**: The PPM file you wish to process.
- **output_file.ppm**: The destination file for the image with reduced color palette.
- **palette_file.txt**: The text file containing the palette colors in RGB.

Example:

```bash
./ppm-color-reducer my_image.ppm reduced_image.ppm my_palette.txt
```

---

> [!CAUTION]
> A potential improvement would be more robust error handling, particularly in handling unexpected file formats or corrupt PPM headers. Additionally, supporting more PPM variants could increase the utility of the script for other users. As a performance note, the operation might become intensive for very large images due to the pixel-by-pixel computation.