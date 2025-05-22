# PPM Color Reducer

---

**ppm-color-reducer**: Reduce colors in a P6 PPM image to a user-defined palette

---

### Dependencies

- `gcc` (for compiling the C source)
- `standard C library` (stdio, stdlib, string, math, limits)
- `P6 PPM-format image` (binary, not ASCII)
- A text palette file (plain text, one color per line as `R,G,B`)

### Description

`ppm-color-reducer` is a C utility that takes a binary P6-formatted PPM (Portable Pixmap) image and reduces all colors to the nearest from a palette file you provide.

**Core flow:**
- Reads a `.ppm` file (must be P6 format: RGB data, binary, MaxVal 255).
- Loads palette entries from a text file, each line formatted as `R,G,B` (values 0-255).
- For every pixel, replaces it with the most similar color from the palette (using squared Euclidean distance in RGB space).
- Outputs a new `.ppm` file with the reduced color map.

**Functions/Concepts used:**
- File I/O and robust error checking
- Efficient scan for nearest color using INT_MAX and distance calculations
- Header and body copying/editing for the PPM binary format

### Usage

In a terminal on Arch Linux:

```sh
# Compile (if not already):
gcc -O2 -o ppm-color-reducer /home/matias/.scripts/bin/ppm-color-reducer

# Usage:
ppm-color-reducer <input_file.ppm> <output_file.ppm> <palette_file.txt>
```

**Example:**
```
ppm-color-reducer in.ppm out.ppm palette.txt
```
Where `palette.txt` could look like:
```
255,0,0
0,255,0
0,0,255
128,128,128
```

**General workflow:**
1. Prepare your palette `.txt`.
2. Prepare a valid binary PPM image (`P6` format, e.g. from GIMP or with scripts like `convert file.jpg out.ppm`).
3. Run the compiled tool with the desired arguments.

Perfect for integrating into image processing pipelines, or assigning as a keybinding in qtile for workflow automation.

---

> [!TIP]
> 
> - **Robustness can be improved**: Script does not handle palette lines with whitespace, or palette files with too many entries robustly. It assumes all input is valid and that colors are within 0–255.
> - **Performance**: For very large palettes or images, nearest neighbor search could be optimized with advanced data structures (e.g., k-d tree), but for modest palette sizes and most practical use cases this is not a problem on a modern machine.
> - **MaxVal handling**: Only images with MaxVal=255 are supported (as enforced in output header), and the script doesn’t check if the input MaxVal matches this. Consider aborting if MaxVal ≠ 255 to avoid surprises!
> - **Input format**: No conversion for ASCII (P3) PPM, only binary (P6) accepted.
> - **Error handling**: Some error paths could be improved by reporting line/file positions, and by releasing resources earlier.
> - **Memory usage**: Palette is statically sized (256), make sure your palette file does not exceed this. Otherwise, palette lines after 256 are ignored without a warning.
> - **Feature expansion**: Optionally allow palettes as hexadecimal or with spaces/tabs, or enable automatic palette generation.
> - **No script shebang**: Remember this is a C program, so don’t forget to (re-)compile if you edit.

Quick and reliable for quick palette-reduction tasks on Arch!