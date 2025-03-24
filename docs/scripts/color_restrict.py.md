# Color Restrictor for Images

---

**color_restrict.py**: Processes an image by restricting its colors to a fixed palette

---

### Dependencies

- `pillow`: For handling image file input/output and transformations.
- `numpy`: For efficient numerical operations and array manipulation.

### Description

This script is designed to process image files by limiting their color range to a predefined palette. It is ideal for environments like Arch Linux with qtile where visual consistency or specific color themes are desired. The script defines a color palette as a NumPy array, containing several RGB tuples. The core functionality is provided by the function find_closest_colors, which calculates the Euclidean distance between each pixel’s RGB value and each color in the palette. Pixels are then replaced by the nearest matching palette color, ensuring that the output image uses only the specified colors.

Another key function, process_image, handles reading the image using Pillow, converting it to RGB if necessary, and resizing it if its dimensions exceed a defined maximum (default 4000 pixels on the larger side). This permits safe processing of large images by reducing computational load while preserving quality through the use of the LANCZOS resampling filter. Finally, the processed NumPy array is converted back to a Pillow image and saved to an output path. The main() function manages command-line argument validation and exception handling to ensure smooth operation.

### Usage

To use the script, run it with Python through your terminal. The script expects two arguments: the input image file and the output file name. For example:

   $ ./color_restrict.py input_image.jpg output_image.jpg

This command will convert "input_image.jpg" into a palette-restricted version and save it as "output_image.jpg". You can integrate this into your qtile environment as a keybinding or automate it via shell scripts.

---

> [!TIP]
> Consider improving the usability by adding more detailed error messages or logging. Additionally, you might extend palette options or provide command-line arguments to customize the maximum image size dynamically. Another improvement could be to allow batch processing of multiple images to further automate your workflow on Arch Linux.