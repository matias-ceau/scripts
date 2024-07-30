# Album Launcher (fzf_albumlauncher.xsh)

---

Launches and plays music albums using fzf to select from Beet's album list.

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

- Xonsh shell
- Beet (music management software)
- fzf (fuzzy finder)
- cmus (curses music player)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to interactively select an album from their music library managed by Beet using the `fzf` fuzzy finder. It leverages the `cmus` music player to play the selected album, providing a seamless command-line experience.

1. The script begins by calling `beet ls -a` to list albums. It uses `sed` to format the output, extracting the album names for selection.
2. The generated list is passed to `fzf`, enabling the user to choose an album interactively.
3. Once an album is selected, the script initiates commands to `cmus` to set the current view, clear current selections, filter the album, mark selected tracks, and queue them for playback.
4. Finally, it saves the current playing list to a temporary `.m3u` file.

---

<a name="usage" />

#### Usage

To use the script, execute it in a terminal. After launching, it will provide an interactive interface via `fzf` where you can choose an album from your music collection. Ensure you have `cmus` running to control playback. 

Run the script using:
```bash
~/.scripts/fzf_albumlauncher.xsh
```

You can bind this script to a keyboard shortcut in your window manager (qtile) for quicker access.

<a name="examples" />

#### Examples

1. Launch the script:
   ```bash
   ~/.scripts/fzf_albumlauncher.xsh
   ```
   - This opens a fzf selection prompt to choose an album.
   
2. Select an album from the list, and it will automatically play in `cmus`.

---

<a name="notes" />

### Notes

Ensure that all dependencies are installed before running the script. The paths and environment might need adjustment based on your specific setup.

> **Critique**
> 
> - The script assumes that `beet ls -a` always returns valid album data; consider adding checks for empty selections.
> - Adding error handling when executing `cmus-remote` commands could make the script more robust, providing feedback when commands fail.
> - Consider implementing an option to clear the playlist before queuing a new selection to prevent overlaps.