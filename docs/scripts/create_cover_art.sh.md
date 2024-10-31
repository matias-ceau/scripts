# Create Spectrogram Cover Art

---

**create_cover_art.sh**: Generates a cover art from .wav file spectrogram with resizing.

---

### Dependencies

- `sox`: A tool used to process and convert audio files. Here, it's used to generate the spectrogram.
- `dmenu`: A dynamic menu for X, used to select the .wav file from a list.
- `imagemagick`: A suite to create, edit, or compose bitmap images, used here to resize the spectrogram image.

### Description

This script automates the creation of cover art by generating a spectrogram from a .wav audio file within the `~/audio/PROJECTS` directory. It uses `sox` to produce a spectrogram image from the audio file. Subsequently, this image is resized using `imagemagick`'s `convert` tool. The selection of the .wav file is made through `dmenu`, which lists all available .wav files for user selection.

- The script starts by finding all `.wav` files in the specified directory and presents them using `dmenu`.
- Once a file is selected, it generates a spectrogram with dimensions of 1600x900 pixels.
- The resultant spectrogram is then resized to a fixed 1600x900 resolution using `convert`.

### Usage

To execute this script, run it in your terminal. Ensure that all dependencies are installed on your Arch Linux system. You may bind this script to a key or execute it directly via terminal:

```bash
~/.scripts/bin/create_cover_art.sh
```

1. When executed, a menu will appear listing all `.wav` files found in `~/audio/PROJECTS`.
2. Select the desired file.
3. The cover art will be created and saved in the same directory as the original file, with `_RESIZED` appended to the filename.

Example terminal command and expected file output:
```bash
sh ~/scripts/bin/create_cover_art.sh
# e.g., for a selected file 'beat.wav', it produces 'beat_RESIZED.png'
```

---

> [!CAUTION] 
> - If there are any additional file types or sub-directory depths, consider enhancing the find command.
> - Using absolute paths in scripts can be limiting; consider parameterization or relative paths for flexibility.
> - The script assumes the presence of required directories and dependencies; a check for these would improve robustness.
