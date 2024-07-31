# PPM Color Reducer

---

**[ppm-color-reducer](ppm-color-reducer.c)**: A tool to reduce color depth in PPM images based on a given palette.

---

### Dependencies

- `gcc`: The GNU Compiler Collection used to compile this C program.
- `stdio.h`: Standard I/O for file operations.
- `stdlib.h`: Standard library for memory allocation and general utilities.
- `math.h`: Math library for basic calculations.
- `string.h`: String manipulation functions.
- `limits.h`: Provides macros for limits of integral types.

### Description

The **PPM Color Reducer** is a C program that reduces the color depth of PPM images (specifically in P6 format) by mapping the colors in the image to a limited palette of colors defined in a separate text file. The palette file should list colors in the format `r,g,b`, where `r`, `g`, and `b` are integers ranging from 0 to 255.

The core functionalities include:
- **Color Structure**: A simple structure to hold RGB values.
- **Color Distance Calculation**: A method to compute the squared Euclidean distance between two colors, allowing the program to find the closest match in the palette.
- **Palette Reading**: Functionality to read and parse the palette from a specified text file, ensuring the data is sanitized and adheres to expected formats.
- **PPM File Handling**: The program reads the header and pixel data from the input PPM file, processes each pixel to find its nearest color in the loaded palette, and writes the modified image to an output file.

### Usage

To run the script, compile the code with `gcc` and then execute it with the necessary parameters. The basic command structure is:

```bash
gcc -o ppm-color-reducer ppm-color-reducer.c
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

#### Example

Given the following files:
- Input File: `image.ppm`
- Output File: `output.ppm`
- Palette File: `palette.txt`

You can run:

```bash
./ppm-color-reducer image.ppm output.ppm palette.txt
```

This will create `output.ppm`, where each pixel's color has been replaced with the nearest color defined in `palette.txt`.

---

> [!TIP]
> The current implementation reads PPM files in binary format (`P6`), which is efficient, but ensure that your input files are formatted correctly. Consider adding more robust error handling or supporting additional PPM formats (like `P3`). Moreover, the palette loading could benefit from additional checks to optimize for maximum color count without exceeding the defined limit.
