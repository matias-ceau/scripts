# Color Reducer for PPM Images

---

**ppm-color-reducer**: A tool to reduce colors in PPM images using a provided palette.

---

### Dependencies

- `gcc`: A C compiler necessary to compile the code.
- `libc`: Standard C library, usually included with any Unix-like operating system.

### Description

The `ppm-color-reducer` script is a C program designed to reduce the number of unique colors in a PPM image. This is achieved by mapping each pixel in the image to the closest color defined in a user-provided palette file. The script specifically supports the P6 format of PPM (Portable Pixmap) images, which stores pixel data in binary form.

The core functionality includes:
- Reading a palette from a file, which consists of RGB color values.
- Computing the squared distance in color space to find the closest color in the palette.
- Processing each pixel of the input PPM image and writing the reduced-color image to an output file.

The program employs a struct to manage RGB color values and utilizes standard file I/O functions to handle palette and image files. 

### Usage

To compile the script, use the following command in the terminal:

```
gcc -o ppm-color-reducer ppm-color-reducer.c -lm
```

Run the program using the command line with this syntax:

```
./ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

#### Example

Assuming you have an input file named `image.ppm`, an output file named `image_reduced.ppm`, and a palette file named `palette.txt`, you would execute:

```
./ppm-color-reducer image.ppm image_reduced.ppm palette.txt
```

Ensure your `palette.txt` file contains colors in the format `r,g,b`, one color per line.

---

> [!TIP]  
> Consider adding error handling for file operations and improving palette loading by allowing for different formats. Additionally, introducing multi-threading could significantly speed up the pixel processing, especially with larger images.