# PPM palette color reducer

---

**ppm-color-reducer**: Reduce a P6 PPM image to the nearest colors from a given palette

---

### Dependencies

- `gcc` (or any C compiler) to build the binary
- `libc` (standard C library; already present on Arch)
- A palette text file in `r,g,b` format (one color per line)

### Description

`ppm-color-reducer` is a small C utility that takes a binary PPM image (`P6`) and remaps every pixel to the *closest* color found in a user-provided palette. This is useful for generating images constrained to a theme palette (e.g., for wallpapers, status icons, or qtile assets).

How it works:

- Reads a palette file (`.txt`) line-by-line:
  - Ignores comments starting with `#` and empty lines
  - Expects `r,g,b` integers (0–255) per line
  - Loads up to 256 colors into an in-memory palette
- Parses the PPM header and ensures the magic number is `P6`
- For each pixel:
  - Computes squared Euclidean distance in RGB space
  - Replaces the pixel with the nearest palette entry
- Writes a new `P6` PPM output (always with max color set to `255`)

This is a brute-force nearest-neighbor quantizer: `O(pixels × palette_size)`.

### Usage

Build:

    gcc -O2 -o ppm-color-reducer /home/matias/.scripts/bin/ppm-color-reducer -lm

Create a palette file (`palette.txt`):

    # nord-ish example
    46,52,64
    59,66,82
    216,222,233

Run:

    ./ppm-color-reducer input.ppm output.ppm palette.txt

Practical tldr:

- Convert to P6 first (if needed), reduce, then optionally convert back:

      magick input.png -compress none ppm:- | ./ppm-color-reducer /dev/stdin out.ppm palette.txt
      magick out.ppm out.png

---

> [!TIP]
> The PPM header parsing with `fscanf("%2s\n%d %d\n%d\n", ...)` won’t handle valid PPMs that contain comment lines in the header (common in the wild). Consider a more robust tokenizer that skips `# ...` anywhere in the header. Also validate palette values (clamp 0–255) instead of blindly casting to `unsigned char`, and consider supporting `P3` or preserving the original `max_color` if it’s not 255. For speed on large images, precomputing a LUT or using a faster nearest-color structure (k-d tree) can help.