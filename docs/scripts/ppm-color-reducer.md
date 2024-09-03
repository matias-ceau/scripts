# PPM Color Reducer

---

**ppm-color-reducer**: A command-line tool to reduce the color depth of PPM images using a custom palette.

---

### Dependencies

- `gcc`: The GNU Compiler Collection, required to compile the C program.
- `ppm` format: The script specifically works with PPM files in the P6 format.

### Description

The `ppm-color-reducer` is a console-based tool that allows users to reduce the color depth of PPM images by mapping their colors to a specified color palette, which is provided in a separate text file. The palette file should contain colors formatted as `r,g,b` where `r`, `g`, and `b` are integers representing the red, green, and blue components of the color, respectively.

Here's how the script functions:
1. **Color Structure**: Defines a `Color` structure to hold RGB values.
2. **Color Distance Function**: Implements the `color_distance_sq` function to compute the squared Euclidean distance between two colors, which is used to find the closest color in the palette.
3. **Palette Reading**: The `read_palette` function loads color values from a given palette file into an internal array.
4. **PPM Processing**: Reads the input PPM file, finds the closest palette color for each pixel, and writes the converted pixel to the output file.

### Usage

To run the script, use the following command in the terminal:

```bash
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

Here’s an example:

```bash
./ppm-color-reducer input.ppm output.ppm palette.txt
```

- `<input_file.ppm>`: The PPM image file that you want to reduce in color depth.
- `<output_file.ppm>`: The resultant PPM file after processing.
- `<palette_file.txt>`: A text file containing the palette of colors, defined in the format `r,g,b`, with one color per line.

Make sure to handle errors properly as the program checks for issues such as file access and format validity.

---

> [!IMPORTANT]  
> This script currently supports only the P6 format of PPM files. You may want to extend the functionality to support P3 format as well, along with additional error handling for various possible edge cases. Additionally, consider implementing logging for better tracking of the operational process. Test the script with various images and palettes to ensure robustness.