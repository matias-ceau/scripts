# random_album.xsh

---

Select random album and play it with cmus.

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

- cmus (C* Music Player)
- xonsh (a Python-powered shell)
- A music library configured in cmus

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to randomly select an album from the user's cmus music library and play it. It leverages the `cmus-remote` command to interact with the cmus player, allowing for playback control from within the script. The script works by constructing a temporary playlist based on the directory structure of albums in the given music library, then instructs cmus to play the selected album.

The script performs the following steps:
1. It clears any current playlist in cmus.
2. It retrieves the paths of music files from cmus' library configuration.
3. It constructs a list of unique albums by processing these paths.
4. It randomly shuffles the album list, selects the first ten paths per the shuffled album, and populates a temporary playlist file.
5. Finally, the script instructs cmus to load the new playlist and begins playback.

---

<a name="usage" />

#### Usage

To run the script, simply execute it with xonsh in the terminal:

```
xonsh /home/matias/.scripts/random_album.xsh
```

The script does not require any command-line arguments, and it is designed to be run interactively. You can also bind this script to a key combination in your window manager (qtile) for quick access.

<a name="examples" />

#### Examples

1. Open a terminal and run the script directly:
   ```bash
   xonsh /home/matias/.scripts/random_album.xsh
   ```

2. Bind the script to a key in your qtile configuration:
   ```python
   Key([mod], "r", lazy.spawn('/home/matias/.scripts/random_album.xsh')),
   ```

---

<a name="notes" />

### Notes

- Ensure that cmus is installed and configured properly to recognize your music library.
- The script will only work if there are at least ten unique albums in the music library; otherwise, it may raise an error while trying to index the album list.
- Consider checking the contents of your `lib.pl` to ensure it is structured as expected.

> **Critique:**  
> This script assumes that there are always at least ten unique albums, which may not be the case. It might be beneficial to add a check for the number of unique albums and adjust the playlist selection logic accordingly. Additionally, the way paths are handled could be made more robust to account for potential errors accessing the `lib.pl` file. Integrating error handling mechanisms would improve the user experience and prevent the script from crashing unexpectedly.