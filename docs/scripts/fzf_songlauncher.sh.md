# fzf_songlauncher.sh

---

Play a song with cmus, chosen interactively using fzf.

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

- cmus: A console music player
- fzf: A general-purpose command-line fuzzy finder
- A music directory named "music" in the current working directory

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `fzf_songlauncher.sh` script allows you to easily select and play a song using the cmus music player. It employs `fzf`, a powerful command-line fuzzy finder, to provide a list of files located in a predefined music directory. The script utilizes the following command:

```sh
cmus-remote -f "$(find -L music -type f | fzf)"
```

Here's a breakdown of the command:

- `find -L music -type f`: This part searches for all files within the "music" directory and its subdirectories, resolving symbolic links if they exist (`-L` flag).
- `| fzf`: The output of the `find` command is piped into `fzf`, allowing for an interactive selection of the files.
- `cmus-remote -f "$( ... )"`: Finally, the selected file is passed to `cmus-remote`, which uses the `-f` option to play the chosen song in the cmus music player.

---

<a name="usage" />

#### Usage

To use the script, simply execute it from the terminal:

```sh
sh fzf_songlauncher.sh
```

This script can also be assigned to a keybinding in a window manager like qtile for quick access. Just ensure the script has execute permissions:

```sh
chmod +x /home/matias/.scripts/fzf_songlauncher.sh
```

<a name="examples" />

#### Examples

1. Run the script by navigating to the directory containing it and executing:

```sh
./fzf_songlauncher.sh
```

2. When prompted, use the search interface to type and select your desired song from the list.

---

<a name="notes" />

### Notes

- Ensure your music files are organized within a directory named "music" located in the current working directory; otherwise, modify the path in the script accordingly.
- You may need to install `fzf` and `cmus` if you haven't done so already.

> **Critique:** 
> The script is straightforward and performs its task effectively, but here are a couple of improvements:
> - Add error handling to manage scenarios where no music files are found, which could lead to an empty selection in `fzf`.
> - Allow for customization of the music directory via an optional argument to make it more flexible.
