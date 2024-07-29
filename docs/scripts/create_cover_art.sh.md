# create_cover_art.sh

**Script Description:**

This is a Bash shell script that creates a covert art based on the spectrogram of an audio file. The script uses various Linux utilities to achieve this functionality.

**Functionality:**

Here's what the script does:

1. **Find and select an audio file**: The script searches for `.wav` files in the `/home/matias/audio/PROJECTS` directory using `find`, filters them with `grep`, and then presents a list of matching files to the user via `dmenu`. The user selects one file.
2. **Extract filename without extension**: Using `printf` and `sed`, the script extracts the filename (without the `.wav` extension) from the selected file path.
3. **Generate spectrogram image**: The script uses `sox` to generate a spectrogram image of the selected audio file, saving it as a PNG file with the extracted filename.
4. **Resize and save resized image**: Using `convert`, the script resizes the generated spectrogram image to 1600x900 pixels and saves the resized image with the `_RESIZED` suffix (e.g., `"filename"_RESIZED.png`).
5. **Remove original spectrogram image**: Finally, the script removes the original spectrogram image file (`"filename".png`) using `rm`.

**Assumptions:**

This script assumes that:

* The necessary dependencies (sox, dmenu, and imagemagick) are installed on the system.
* The `/home/matias/audio/PROJECTS` directory contains `.wav` files to be processed.
* The user has permission to read and write files in the specified directory.