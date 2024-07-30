# create_cover_art.sh

# Spectrogram Cover Art Generator

This script creates a cover art image based on the spectrogram of an audio file. It utilizes `sox`, `dmenu`, and `imagemagick` to achieve this functionality.

## Prerequisites

Ensure you have the following tools installed before running the script:
- `sox`
- `dmenu`
- `imagemagick`

## Usage

To run the script, use the following command:

```sh
./your-script-name.sh
```

### Script Flow

1. **Audio File Selection:**
    - The script searches for `.wav` audio files within the `/home/matias/audio/PROJECTS` directory.
    - It presents a list of found `.wav` files using `dmenu` for the user to select from.

2. **File Naming:**
    - The selected file's name is processed to remove the `.wav` extension.

3. **Spectrogram Generation:**
    - The `sox` tool generates a spectrogram of the selected audio file. The output is a `.png` image file.

4. **Image Resizing:**
    - The script uses `convert` from the `imagemagick` suite to resize the spectrogram image to 1600x900 pixels. The resized image is saved with a `_RESIZED` suffix.

5. **Cleanup:**
    - The original, unresized spectrogram image is deleted, leaving only the resized version.

## Detailed Command Breakdown

- **File Selection:**
    ```sh
    file="$(find /home/matias/audio/PROJECTS | grep .wav | dmenu -l 30)"
    ```
    - `find /home/matias/audio/PROJECTS`: Searches for files in the specified directory.
    - `grep .wav`: Filters the search results to include only `.wav` files.
    - `dmenu -l 30`: Displays a menu of up to 30 items for user selection.

- **Naming Preparation:**
    ```sh
    name="$(printf $file | sed 's/.wav//')"
    ```
    - `printf $file`: Outputs the selected file name.
    - `sed 's/.wav//'`: Removes the `.wav` extension from the file name.

- **Spectrogram Creation:**
    ```sh
    sox $file -n spectrogram -x 1600 -Y 900 -r -o "$name".png
    ```
    - `sox $file -n spectrogram`: Generates a spectrogram of the audio file.
    - `-x 1600 -Y 900`: Sets the resolution of the spectrogram.
    - `-r -o "$name".png`: Specifies the output file name and format.

- **Image Resizing:**
    ```sh
    convert "$name".png -resize 1600x900! "$name"_RESIZED.png
    ```
    - `convert "$name".png -resize 1600x900!`: Resizes the spectrogram to 1600x900 pixels.
    - `"$name"_RESIZED.png`: Specifies the name of the resized image.

- **Original Spectrogram Removal:**
    ```sh
    rm "$name".png
    ```
    - `rm "$name".png`: Removes the original (unresized) spectrogram image.

## Example

To illustrate, if you have an audio file named `track.wav` in the projects directory, the script will generate the following files:
- `track_RESIZED.png`: The resized spectrogram image.

## Notes

- Customize the script by altering the directories or image dimensions to fit your specific requirements.
- Make sure that the `/home/matias/audio/PROJECTS` directory contains `.wav` files for the script to function correctly.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

*Auto-generated documentation: Adaptable to your specific script location and needs.*
