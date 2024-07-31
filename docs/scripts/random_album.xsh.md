# Random Album Selector (random_album.xsh)

---

Select a random album and play it with cmus.

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

- cmus - A lightweight music player for the terminal.
- xonsh - A Python-powered shell.
- Basic shell utilities (such as `cat`).

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `random_album.xsh` script facilitates the random selection of an album within the cmus music player. When executed, it first clears the current cmus playlist and fetches the album paths from the cmus library. The script randomly selects one album from these paths and composes a temporary playlist containing ten tracks from the selected album. This temporary playlist is then loaded into cmus for immediate playback.

Key components of the script include:
- Utilization of `cmus-remote` for communication with the cmus player.
- Use of Python's built-in `random` module to shuffle and select albums.
- File I/O for creating a temporary playlist.

---

<a name="usage" />

#### Usage

To use this script, ensure it is executable and run it in a terminal where you have xonsh installed. Simply execute:

```bash
./random_album.xsh
```

This will select a random album from the cmus library and initiate playback.

<a name="examples" />

#### Examples

Simply run the script:

```bash
./random_album.xsh
```

This command plays a random album's tracks through cmus.

---

<a name="notes" />

### Notes

- Ensure that your cmus library is correctly set up and populated with albums to maximize the effectiveness of this script.
- The script selects a random album from the list of albums available in `~/.config/cmus/lib.pl` and plays the first 10 tracks found. 
- The temporary playlist is stored in `~/.config/cmus/.temp.m3u`.

> **Critique**: 
> - The script currently assumes there are at least 10 albums available to choose from, which could lead to an error if there aren't enough albums or tracks in the library. Adding error handling to check the count of albums would improve robustness.
> - The commented-out code regarding `beet` suggests there may be an alternative method for selecting albums that is not being utilized. If `beet` access is possible, integrating that logic could add more flexibility in album selection.
> - Consider enhancing user feedback (e.g., print statements to indicate which album is being played) for a better user experience.