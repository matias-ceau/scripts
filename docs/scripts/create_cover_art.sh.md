# Create Cover Art (create_cover_art.sh)

---

Generate cover art from an audio file's spectrogram in PNG format.

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

- `sox` - Sound file processing tool.
- `dmenu` - Dynamic menu for X.
- `imagemagick` - Image manipulation software.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to create aesthetically pleasing cover art by generating a spectrogram image from a selected `.wav` audio file. The use of `sox` facilitates the extraction of the audio visual representation, while `dmenu` provides an interactive way to select files from a predefined directory. The script also utilizes `imagemagick` to resize the generated image for better usability. The extracted spectrogram image is stored as a PNG file, with an additional resized version created for standard display requirements.

---

<a name="usage" />

#### Usage

1. Execute the script in a terminal:
   ```sh
   /home/matias/.scripts/create_cover_art.sh
   ```
   
2. A `dmenu` prompt will appear, listing `.wav` files found in the `/home/matias/audio/PROJECTS` directory. Use arrow keys to navigate and select a file.

3. Upon selection, the spectrogram for the chosen file will be generated and saved in the same location, with the filename corresponding to the original audio file name.

4. The script also creates a resized version of the spectrogram, removing the original once the resized version is complete.

<a name="examples" />

#### Examples

- To create cover art for an audio file:
   1. Run the script.
   2. Select a `.wav` file from the list.
   3. Cover art will automatically generate.

---

<a name="notes" />

### Notes

Ensure that `sox`, `dmenu`, and `imagemagick` are installed on your Arch Linux system prior to running this script to avoid any execution errors.

> **Critique:** 
> 
> - The script only searches for `.wav` files with a hardcoded path, making it less flexible for other audio formats or directories.
> - Error handling for cases where no `.wav` files are found or when `sox`/`convert` commands fail is missing.
> - The script can be enhanced with options for adjusting spectrogram parameters (like dimensions and colors) through command-line arguments.