# FZF Song Launcher (fzf_songlauncher.sh)

---

Play a song with cmus (choose it with fzf)

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

- cmus (C Music Player)
- fzf (Fuzzy Finder)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `fzf_songlauncher.sh` script is a simple yet effective tool that integrates the powerful command line music player **cmus** with **fzf**, a fuzzy file finder. This script allows users to navigate through their music files located in the `music` directory with an interactive fuzzy search. By executing this script, users can quickly select a song, which will then be played in **cmus**. 

The script utilizes `find` to iterate through the music files and `fzf` to present a list to the user. Here’s a breakdown of the command used:

- `find -L music -type f`: This command locates all files in the `music` directory, with the `-L` option allowing it to follow symbolic links.
- `fzf`: This command provides an interactive fuzzy search interface, enabling users to filter and select their desired music file easily.
- `cmus-remote -f`: This command interacts with cmus, instructing it to play the selected file by passing it to `-f`.

---

<a name="usage" />

#### Usage

To use the script, simply run it in the terminal:

```bash
/home/matias/.scripts/fzf_songlauncher.sh
```

Make sure that your terminal has access to the `music` directory and both **cmus** and **fzf** are installed. You can also create keybindings in your window manager, like `qtile`, to execute this script more efficiently. 

<a name="examples" />

#### Examples

1. **Run the script**: 
   ```bash
   /home/matias/.scripts/fzf_songlauncher.sh
   ```
   This will open a fuzzy finder interface where you can start typing to filter the songs.

2. **Keybinding Example** (in qtile):
   ```python
   Key([mod], "m", lazy.spawn("/home/matias/.scripts/fzf_songlauncher.sh")),
   ```
   This binds the `mod + m` key combination to invoke the script.

---

<a name="notes" />

### Notes

- Make sure that your `music` directory contains song files and is accessible by the script.
- Ensure that **cmus** is running in the background before executing this script, as it relies on `cmus-remote`.

> **Critique**: 
> - The script assumes that the `music` directory is always present and accessible, which might not be the case for all users. An improvement could be adding error handling to check if the directory exists before proceeding.
> - Consider adding the ability to specify the directory as an argument, allowing for more flexibility in where the music files are located.