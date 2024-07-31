# Create Cover Art from WAV Files

---

**[create_cover_art.sh](/create_cover_art.sh)**: A script to generate cover art from WAV file spectrograms

---

### Dependencies

- `sox`: A command-line utility that handles audio processing, required here to create the spectrogram.
- `dmenu`: A dynamic menu for X, used for file selection in this script.
- `imagemagick`: A software suite to create, edit, compose, or convert bitmap images, necessary for image processing in the script.

### Description

This script is designed to generate cover art from the spectrogram of WAV audio files located in the user's `PROJECTS` directory. It uses a combination of `sox` to create the spectrogram and `imagemagick` to resize the resulting image. 

The process is straightforward:
1. The script initiates by searching for all `.wav` files in `/home/matias/audio/PROJECTS` using the `find` command.
2. It lets the user select a file through `dmenu`, which presents a list of found WAV files.
3. Once a file is selected, `sox` generates a spectrogram image of the selected audio file, saving it as a PNG.
4. The PNG image is then resized to 1600x900 pixels using `convert` from ImageMagick.
5. After resizing, the original PNG file is deleted, leaving only the resized version.

### Usage

To use the script:

1. Make sure all dependencies (`sox`, `dmenu`, `imagemagick`) are installed.
2. Save the script as `create_cover_art.sh` and make it executable:

   ```bash
   chmod +x /home/matias/.scripts/create_cover_art.sh
   ```

3. Run the script from a terminal:

   ```bash
   /home/matias/.scripts/create_cover_art.sh
   ```

Once executed, a menu will appear listing all the available `.wav` files in your projects folder. Select one to generate its cover art.

---

> [!TIP]  
> Consider adding error handling to the script. For example, check if the `find` command returns any files or handle cases where `sox` might fail. This will make the script more robust and user-friendly. Additionally, you could allow for different output sizes or file formats as user inputs to enhance functionality.
