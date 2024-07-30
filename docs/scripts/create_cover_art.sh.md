
---

Create a cover art based on a file spectrogram

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- sox
- dmenu
- imagemagick

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `create_cover_art.sh` script generates a cover art image from the spectrogram of a WAV file. It leverages the `sox` tool to create a spectrogram of the audio file and `imagemagick` to manipulate the output image. The script utilizes `dmenu` to provide a user-friendly way of selecting the file from a predefined directory where the audio projects are stored.

Here's a breakdown of how the script works:
1. It searches for WAV files in the `/home/matias/audio/PROJECTS` directory.
2. A file is selected via `dmenu`, which displays a list of found files.
3. The script generates a spectrogram image using `sox`, saves it as a PNG file, resizes it to specified dimensions, and cleans up by removing the intermediate file.

---

<a name="usage" />

#### Usage

To use this script, simply run it from the terminal. The script does not require any command-line arguments and is designed to run interactively:

```sh
/home/matias/.scripts/create_cover_art.sh
```

You can also bind this script to a key shortcut in your window manager (Qtile) for quick access.

<a name="examples" />

#### Examples

- Run the script by executing the following command:

```sh
/home/matias/.scripts/create_cover_art.sh
```

- A `dmenu` window will pop up, allowing you to select a `.wav` file. After selection, the spectrogram will be generated and resized.

---

<a name="notes" />

### Notes

- Ensure `sox`, `dmenu`, and `imagemagick` are installed on your Arch Linux system for the script to function correctly.
- The output image is named by appending `_RESIZED` to the original file name, maintaining a clean naming convention.

> **Critique:** 
> The script is straightforward and efficient, but it lacks error handling. If no WAV files are found or if the `dmenu` selection is canceled, the script will fail without a graceful handling of those cases. It would be beneficial to add checks for:
> - An empty file selection.
> - Successful creation of the spectrogram image.
> - Availability of dependencies.