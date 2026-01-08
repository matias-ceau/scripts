# GRUB tune → MP3 converter

---

**grub-tune-to-audio-python.py**: Convert a GRUB_INIT_TUNE string into an MP3 audio file

---

### Dependencies

- `python` (runs the script)
- `pydub` (audio segment handling + sine generator)
- `ffmpeg` (required by `pydub` to export MP3)

Optional but useful on Arch:
- `python-pydub` (package name in repos/AUR depends on your setup)
- `ffmpeg` (system package)

### Description

This script takes a `GRUB_INIT_TUNE`-style string (the one you would put in `/etc/default/grub`) and renders it as an audio file.

How it works:

- The input is split into integers:  
  `tempo freq1 beats1 freq2 beats2 ...`
- `tempo` (first value) is interpreted as beats per minute (BPM).
- Beat duration is computed as `60000 / tempo` milliseconds.
- Notes are processed in pairs:
  - `freq` is the sine wave frequency in Hz.
  - `beats` is the number of beats the note lasts.
- Each note becomes a generated sine tone (`pydub.generators.Sine`) concatenated into a single `AudioSegment`.
- The final result is exported to `output.mp3` in the current working directory.

This is handy to preview GRUB boot tunes without rebooting, and to iterate quickly on melodies from within your Arch + qtile environment.

### Usage

Run interactively from a terminal:

```sh
./grub-tune-to-audio-python.py "480 440 1 660 1 880 2"
```

Or explicitly with Python:

```sh
python /home/matias/.scripts/bin/grub-tune-to-audio-python.py "480 1000 1 0 1 1000 1"
```

Result:

- Creates `./output.mp3`
- Prints a confirmation message

Tip: for qtile workflows, this can be bound to a keybinding that re-renders a tune after editing, but it currently always writes to the same filename.

---

> [!TIP]
> Improvements to consider:
> - Validate input length (must be `1 + 2*n` ints) and handle non-integer/empty strings gracefully.
> - Support rests (`freq=0`) by inserting silence instead of generating a 0 Hz sine.
> - Add CLI options for output path/format (`--out`, `--format`), normalization/volume, and a preview playback option.
> - Exporting MP3 requires `ffmpeg`; detecting and erroring with a clearer message would reduce confusion on fresh Arch installs.