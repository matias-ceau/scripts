# Spectrogram Cover Art Generator

---

**create_cover_art.sh**: Create a cover art image from a `.wav` spectrogram

---

### Dependencies

- `sox` — generates the spectrogram image from audio
- `dmenu` — interactive picker to select the `.wav` file
- `imagemagick` (`convert`) — resizes the generated PNG
- `find`, `grep`, `sed`, `rm` — standard Unix utilities (present on Arch by default)

### Description

This script creates “cover art” by turning a WAV file into a spectrogram image. It’s tailored to your local audio workspace under `/home/matias/audio/PROJECTS`:

1. It lists WAV files under `~/audio/PROJECTS` and lets you choose one via `dmenu`.
2. It computes a spectrogram using `sox` with a fixed resolution and scaling:
   - `-x 1600` sets the spectrogram width in pixels
   - `-Y 900` sets the intensity (dB range) / visual scaling
   - `-r` enables a “raw” style rendering (no extra annotations)
3. It resizes the image to exactly `1600x900` using ImageMagick, producing a second file with the `_RESIZED` suffix.
4. It removes the original PNG and keeps only the resized one.

Output files are written next to the selected WAV, using the same base name:
- `…/track.wav` → `…/track_RESIZED.png`

### Usage

Run from a terminal session under X11/Wayland (needs `dmenu`):

    ~/.scripts/bin/create_cover_art.sh

Typical flow:
- Select a `.wav` entry in the `dmenu` list
- The resulting image appears alongside the audio file

Qtile keybinding example:

    Key([mod], "c", lazy.spawn("~/.scripts/bin/create_cover_art.sh"), desc="Create spectrogram cover art")

---

> [!TIP]
> Consider hardening quoting and selection: `printf $file` should be `printf '%s' "$file"` (paths with spaces will break), and `find … | grep .wav` can match unintended files; prefer `find … -type f -iname '*.wav'`. Also, `sed 's/.wav//'` removes only the first “wav” match; use `sed 's/\.wav$//'`. You could avoid the extra resize+delete step by generating the spectrogram at the final size directly (verify `sox spectrogram` options), and add a “cancel” guard if the dmenu selection is empty.