# ppm-color-reducer

**Script Description**

The given C code is a PPM image converter that takes an input PPM file, a palette file, and outputs a converted PPM file with color quantization using the provided palette. The script uses the `color_distance_sq` function to find the closest color in the palette for each pixel in the input image.

**Functionality**

Here's a step-by-step breakdown of the script's functionality:

1. **Palette Loading**: The script loads a color palette from a file specified by the user (e.g., `palette_file.txt`). Each line in the file should contain three space-separated integer values representing the red, green, and blue (RGB) components of a color.
2. **Color Quantization**: For each pixel in the input PPM image, the script uses the `find_closest_color` function to determine the closest color in the loaded palette based on Euclidean distance between RGB values.
3. **Output File Creation**: The script creates an output PPM file with the same width and height as the input image but with a maximum color value of 255 (i.e., the maximum color value in the palette).
4. **Pixel Processing**: The script reads each pixel from the input image, finds its closest match in the palette using `find_closest_color`, and writes this closest color to the output file.
5. **Error Handling**: If any errors occur during file operations or color parsing, the script prints an error message and exits with a non-zero status code.

**Input/Output Requirements**

The script expects the following input files:

* `input_file.ppm`: The input PPM image file.
* `palette_file.txt`: The color palette file containing RGB values for each line.
* `output_file.ppm`: The output PPM file to be created with quantized colors.

Note that the script assumes a specific format for the input and output files, including the header lines in PPM format.