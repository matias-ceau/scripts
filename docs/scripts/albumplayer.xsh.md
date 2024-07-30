# Album Player (albumplayer.xsh)

---

Play an album using cmus with a selection interface via dmenu.

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

- cmus
- dmenu
- xonsh

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `albumplayer.xsh` script offers a convenient way to play an album using the command-line music player, cmus. This is achieved through a selection interface powered by `dmenu`, allowing users to visually browse available albums. 

Upon execution, the script reads the album paths defined in the `.config/cmus/lib.pl` file, gathers unique album names, and presents them to the user via `dmenu`. Once an album is selected, the script constructs a temporary playlist consisting of the selected album and a randomized selection of tracks from other albums.

The script utilizes the xonsh shell, which combines Python syntax with shell command capabilities, allowing for concise and powerful scripting.

---

<a name="usage" />

#### Usage

To use the script, simply run it from a terminal:

```bash
./albumplayer.xsh
```

Ensure that the script has execute permissions. This can be done with the following command:

```bash
chmod +x /home/matias/.scripts/albumplayer.xsh
```

Since the script integrates with cmus, it assumes that cmus is installed and your music library is set up correctly.

<a name="examples" />

#### Examples

- To play an album, just execute the script in a terminal:

```bash
/home/matias/.scripts/albumplayer.xsh
```

The script will show a list of albums. Select one to begin playback.

---

<a name="notes" />

### Notes

- This script generates a temporary playlist located at `~/.config/cmus/.temp.m3u`, making it dependent on cmus's configuration.
- Ensure your `.config/cmus/lib.pl` file is formatted correctly to avoid issues in album detection.

> **Critique:** 
> The script could benefit from error handling, especially for cases where no albums are available or if the `lib.pl` file is missing or improperly formatted. Implementing checks on the output from `dmenu` to ensure a selection was made could also enhance user experience. Additionally, the user might appreciate an option to specify the number of random tracks to include from other albums.