# Create Cover Art

---

**create_cover_art.sh**: Create a cover art based on file spectrogram.

---

### Dependencies

- `sox`: A command-line utility that processes audio files. It is used here to generate the spectrogram from the audio file.
- `dmenu`: A dynamic menu for X, which is utilized to select the audio file interactively.
- `imagemagick`: An image manipulation toolset, used for resizing the generated spectrogram image.

### Description

The `create_cover_art.sh` script provides a way to create visually appealing cover art from audio files in WAV format. It accomplishes this by generating a spectrogram of the audio, which represents the frequency spectrum as it varies with time.  

When executed, this script performs the following steps:

1. **File Selection**: It uses `find` to search for `.wav` files in the specified directory (`/home/matias/audio/PROJECTS`) and displays them in a list using `dmenu`. This allows the user to select which audio file to process.
  
2. **Spectrogram Creation**: Once a file is selected, `sox` is used to create a spectrogram image saved as a PNG file. The spectrogram has a resolution set at 1600x900 pixels.

3. **Image Resizing**: After the spectrogram is generated, it is resized to 1600x900 pixels again using the `convert` command from ImageMagick. The resized image is saved with an appended "_RESIZED" suffix.

4. **Cleanup**: Finally, the original unresized spectrogram image is removed to save storage space.

### Usage

To run the script, simply execute it from a terminal. Make sure to have the necessary dependencies installed. Here’s how you can execute the script:

```bash
sh /home/matias/.scripts/create_cover_art.sh
```

Upon execution, a `dmenu` will pop up displaying the available `.wav` files. Select a file, and the script will generate the cover art in the same directory as the audio file.

---

> [!TIP] 
> Potential improvements include adding error handling for cases where no `.wav` files are found or if the user cancels the `dmenu` selection. Additionally, providing configurable parameters for spectrogram dimensions and output quality could enhance usability and flexibility.