# Generate Cover Art from Audio Spectrogram

---

**create_cover_art.sh**: Automatically generates cover art from audio spectrograms using `.wav` files.

---

### Dependencies

- `sox`: A utility that is required for generating the spectrogram from audio files.
- `dmenu`: A dynamic menu used for the selection of `.wav` files within the specified directory.
- `imagemagick`: Provides the `convert` tool, which is necessary for image resizing.

### Description

This script generates a visual cover art representation from the spectrogram of a chosen `.wav` file in the `/home/matias/audio/PROJECTS` directory. The cover art is then resized to the specified dimensions of 1600x900 pixels, ensuring consistency in resolution across different projects.

- **File Selection**: It uses `dmenu` to allow the user to interactively choose a file from a list of `.wav` files, offering an interface that displays up to 30 options at once.
- **Spectrogram Creation**: Utilizes `sox` to create a spectrogram image (`.png`) of the chosen audio file, with predefined dimensions.
- **Image Resizing**: Employs `imagemagick` to adjust the spectrogram image size to exactly 1600x900 pixels.
- **Cleanup**: The original spectrogram image is removed after resizing, leaving only the final resized image.

### Usage

To run this script, ensure you have the necessary dependencies installed. You can execute the script directly from the terminal:

```bash
sh /home/matias/.scripts/bin/create_cover_art.sh
```

Upon executing, `dmenu` will prompt you with a list of `.wav` files. Select the desired file, and the script will handle the spectrogram creation and resizing automatically.

If you wish to bind this script to a key combination in your `qtile` window manager, you can add it to your keybindings configuration.

---

> [!NOTE]
> Consider adding error handling to manage scenarios where the `find` command returns no files, or if `sox` or `imagemagick` fail to process the file. Additionally, allowing flexibility in selecting directories or adding options for specifying output dimensions could enhance usability.