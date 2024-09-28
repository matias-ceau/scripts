# Create Spectrogram Cover Art

---

**create_cover_art.sh**: Generates cover art from audio file spectrograms.

---

### Dependencies

- `sox`: Required for generating the spectrogram from the audio file.
- `dmenu`: Used to present a list of `.wav` files for selection.
- `imagemagick`: Utilized for resizing the generated spectrogram image.

### Description

The `create_cover_art.sh` script allows users to create an image representation of the audio spectrum of a `.wav` file, ideal for use as cover art. The script takes advantage of `dmenu` to list available `.wav` files under the `/home/matias/audio/PROJECTS` directory for selection. The selected `.wav` file is then processed using `sox` to create a spectrogram, which is subsequently resized using `imagemagick` to a resolution of 1600x900 pixels. The intermediate spectrogram image is removed after resizing to save space.

The resulting image is saved with the same name as the audio file, appended with `_RESIZED`.

### Usage

To use this script, execute it from a terminal. It is designed to be interactive, requiring the selection of a `.wav` file through a `dmenu` interface:

```sh
sh /home/matias/.scripts/create_cover_art.sh
```

Once run, a `dmenu` window will appear, allowing you to select the `.wav` file. Upon selection, the script generates and resizes the spectrogram. The resultant image will be saved in the same directory as the original `.wav` file with `_RESIZED.png` appended to its filename.

---

> [!TIP]
> Consider adding error checking for cases where no file is selected or if any of the command processes fail. Additionally, you might want to add a check to ensure that `dmenu`, `sox`, and `imagemagick` are installed before attempting to use them. This can improve user experience by providing meaningful feedback when something goes wrong.