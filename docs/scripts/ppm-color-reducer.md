# PPM Color Reducer

---

**ppm-color-reducer**: Reduce the number of colors in a PPM image using a specified palette.

---

### Dependencies

- `stdio.h`, `stdlib.h`: Standard input/output and utility libraries.
- `math.h`: Math utilities.
- `string.h`: String handling functions.
- `limits.h`: For `INT_MAX`, used to initialize the minimum distance.
- PPM image file (P6 format).
- Text file containing the palette colors in "r,g,b" format.

### Description

The **ppm-color-reducer** is a C program designed to reduce the number of colors in a PPM formatted image using a specified palette. It reads the input palette from a text file where each line contains a color in the format `r,g,b`. The image is processed pixel by pixel, and each pixel is replaced by the closest color from the palette based on the Euclidean distance in the RGB color space. The script currently supports images in the P6 binary format of PPM.

### Usage

To run the script, compile it using a C compiler and execute it with the following command:

```shell
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

- **input_file.ppm**: The PPM image file you want to color reduce.
- **output_file.ppm**: The file where the reduced color image will be saved.
- **palette_file.txt**: A text file containing the colors to use in the format `r,g,b`, one per line.

#### Example:

```shell
./ppm-color-reducer input.ppm output.ppm colors.txt
```

This will take the `input.ppm` file, apply the color reduction based on `colors.txt`, and write the results to `output.ppm`.

---

> [!TIP]
> - Ensure that your palette file does not exceed 256 colors, as the array `palette` has a fixed maximum size of 256.
> - The script currently supports only P6 (binary) PPM files. Extending this script to handle other PPM formats can increase its usability.
> - Error handling for file operations could be improved by checking file permissions and validating the input files beforehand.