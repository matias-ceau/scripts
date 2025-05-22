# Create Cover Art from Audio Spectrogram

---

**create_cover_art.sh**: generates a cover image by creating a spectrogram from a selected `.wav` file.

---

### Dependencies

- `sox`  
  Audio processing tool; used to generate spectrograms from audio files.
- `dmenu`  
  Dynamic menu for X; provides an interactive way to pick a `.wav` file.
- `imagemagick` (`convert`)  
  Suite for image processing; used to resize the generated spectrogram.

---

### Description

This script is designed to quickly produce a visual cover (art) for an audio file by generating and resizing the spectrogram of a selected `.wav` file. Intended for workflows where visual art for audio projects is needed, it leverages:

- **sox**: to create a high-resolution (1600x900) PNG spectrogram of the `.wav` source selected by the user.
- **dmenu**: to interactively present all `.wav` files under `/home/matias/audio/PROJECTS` for easy selection within a X session (works seamlessly under qtile).
- **ImageMagick**: to force the spectrogram image into the desired 1600x900 resolution, ensuring uniform cover sizes.
- Intermediate files are managed efficiently: the original spectrogram is deleted after resizing, keeping only the final `_RESIZED.png` image.

The script maintains a simple pipeline and expects the user to be at least minimally familiar with the terminal and X-based app launching.

---

### Usage

tldr:

```sh
/home/matias/.scripts/bin/create_cover_art.sh
```

**What happens:**

1. A `dmenu` menu appears listing all `.wav` files in `/home/matias/audio/PROJECTS`.
2. You choose one file (via keyboard navigation/typing).
3. The script:
    - Creates a spectrogram image (`file.png`).
    - Resizes it to 1600x900 pixels (`file_RESIZED.png`).
    - Deletes the unresized temporary image.
4. The final result is `file_RESIZED.png` next to your original `.wav` file.

**You can:**
- Assign the script to a qtile keybinding for even faster access.
- Chain it with further artwork automation scripts if desired.

---

> [!TIP]
> - The script has no checking for user cancellation in `dmenu` (empty selection).
> - It does not escape spaces or special characters in filenames; files with such names may cause errors.
> - All operations are done in-place in the same directory as the selected `.wav`, which could clutter your project folder with image files.
> - Consider adding error handling and filename quoting (e.g. `"$file"`, `"$name"`) to improve robustness.
> - If multiple files with the same base name (but different extensions) exist, overwriting is possible.