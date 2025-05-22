# Color Restrict Script

---

**color_restrict.py**: Restricts image colors to those in a custom palette with optional resizing.

---

### Dependencies

- `pillow` (PIL): Required for image loading, conversion, and saving.
- `numpy`: Used for efficient pixel array manipulation and color matching.
- Python 3.13+ (uses some modern type annotations and possibly new features)
- `uv` (for running with `uv run` as per shebang, a Python package/dependency runner)

---

### Description

This script restricts the colors of any given image to a fixed, hardcoded palette. The palette is defined in the `PALETTE` numpy array and covers a variety of earthy and neutral tones, suitable for stylized effects or palette-limited graphics.

#### Core Workflow:
- **Input:** Takes an image file as input.
- **Resize:** If the image's largest dimension exceeds 4000px, it is proportionally resized using high-quality Lanczos resampling, helpful for processing very large images without running out of RAM.
- **Palette Reduction:** All pixels in the image are mapped to the closest color in the specified palette using efficient numpy broadcasting and vectorized operations (see `find_closest_colors` function).
- **Output:** The resultant image (palette-reduced) is saved to the given output path.

#### Functions:
- `find_closest_colors`: Finds, for each pixel, the palette color with the minimum Euclidean distance in RGB space.
- `process_image`: Handles image loading, optional resizing, applying the palette conversion, and saving.
- `main`: Validates arguments and manages the program flow.

---

### Usage

You can run this script from the command line or assign it to a Qtile keybinding or launcher. It is not interactive; explicit file paths are required. Example usage:

```sh
uv run color_restrict.py input_image.jpg output_image.jpg
```

**Arguments:**
- `input_image.jpg`: Path to source image.
- `output_image.jpg`: Path to save the palette-converted image.

You might want to bind this to a key in Qtile or use with a file manager custom action.

**tldr:**
```
color_restrict.py <input> <output>
```

---

> [!NOTE]
> - The script is performant for reasonably-sized images thanks to vectorized numpy operations, but processing very large images may still require considerable RAM.
> - The color palette is hardcoded; consider adding a command-line switch to load custom palettes if needed for flexibility.
> - The maximum image dimension (4000px) is also hardcoded. Making this a user-supplied argument would improve the script's general utility.
> - The output is always in JPEG or PNG format (determined by extension), but the format is not otherwise checked; you may wish to add error handling to verify format support and output path validity.
> - The use of Python >=3.13 and the `uv` runner may limit compatibility on some systems. Ensure `uv` is installed (`pip install uv`) and available in your `$PATH`.
