# Palette Color Restrict (Nearest-Color Quantizer)

---

**color_restrict.py**: Reduce an image to a fixed RGB palette by nearest-color matching

---

### Dependencies

- `uv` (runtime): script shebang uses `uv run --script` to manage deps and run it
- `python>=3.13`
- `pillow` (PIL): image loading, RGB conversion, resizing, saving
- `numpy`: fast vectorized distance computation over all pixels

### Description

`color_restrict.py` takes an input image and remaps every pixel to the closest color from a hardcoded palette (`PALETTE`). The matching is done with a vectorized Euclidean distance in RGB space:

- The image is opened via Pillow and forced into `RGB` mode.
- If the image is very large, it is downscaled so that the largest dimension is at most `max_size` (default: `4000`) using `LANCZOS` resampling.
- Pixels are converted to a NumPy array and passed to `find_closest_colors()`, which:
  - reshapes the image to a flat list of RGB triples,
  - computes squared distances to each palette entry using broadcasting,
  - selects the nearest palette color per pixel (`argmin`),
  - reshapes back and saves.

This is useful for enforcing a consistent look across assets (wallpapers, UI mockups, theme previews) and pairs well with a qtile theming workflow where you want images to match your chosen scheme.

### Usage

Run directly (uv will install/resolve deps as needed):

    ./color_restrict.py input.jpg output.png

Or explicitly:

    uv run /home/matias/.scripts/dev/color_restrict.py input.png output.png

tldr:

- Convert and overwrite to a new file:

      ./color_restrict.py in.png out.png

- Best practice: use PNG for output to avoid extra JPEG artifacts.

---

> [!TIP]
> The palette mapping ignores alpha channels; transparent PNGs will be flattened to RGB. Consider handling `RGBA` by preserving alpha (process RGB channels only, then reattach alpha). Also, nearest-color in RGB space can look harsh; adding optional dithering (e.g., Floyd–Steinberg) or converting to a perceptual space (Lab/OKLab) before distance computation can improve visual results. Finally, `max_size` is hardcoded—exposing it as a CLI flag would make the script more flexible.