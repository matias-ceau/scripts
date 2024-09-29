# Create Cover Art

---

**create_cover_art.sh**: Creates cover art based on file spectrograms from WAV files.

---

### Dependencies

- `sox`: A command-line utility for processing audio files, required for generating the spectrogram.
- `dmenu`: A dynamic menu for X, needed for selecting the audio file interactively.
- `imagemagick`: A suite of tools and libraries to manipulate images, required for resizing the spectrogram image.

### Description

This script is designed to generate cover art for audio projects by creating a spectrogram of `.wav` files located within a specific directory. The script performs the following operations:

1. **File Selection**: It uses `dmenu` to present a list of `.wav` files found in the `/home/matias/audio/PROJECTS` directory for the user to select.
2. **Spectrogram Generation**: After a file is selected, the script utilizes `sox` to create a spectrogram image by rendering the audio file in a PNG format.
3. **Image Resizing**: The generated image is then resized to ensure it meets desired specifications using `imagemagick`.
4. **Cleanup**: The original spectrogram file is removed to save space, leaving only the resized image.

The command used for spectrogram creation is:
```
sox $file -n spectrogram -x 1600 -Y 900 -r -o "$name".png
```
This command specifies the resolution and dimensions of the output spectrogram.

### Usage

To use the script, run it from the terminal. Ensure that your audio files are in the specified directory and that you have the required dependencies installed. 

To run the script, execute:
```bash
sh /home/matias/.scripts/create_cover_art.sh
```
Once executed, a `dmenu` interface will allow you to select which `.wav` file you want to process. After selecting a file, the script will generate a resized spectrogram image named `filename_RESIZED.png`.

---

> [!TIP]  
> Consider adding error handling to the script to account for scenarios where no `.wav` files are found or if the `dmenu` selection is canceled. This will improve the user experience and prevent potential script failures. Additionally, implementing more flexible resolutions as command-line arguments instead of hardcoding values could enhance the script's versatility.