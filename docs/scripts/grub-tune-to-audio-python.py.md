# Convert GRUB Tune to Audio (Python)

---

**grub-tune-to-audio-python.py**: Converts a GRUB_INIT_TUNE string into an MP3 audio file

---

### Dependencies

- `python` (3.x): Interpreter for running the script
- `pydub`: Python library for audio manipulation and synthesis (`pip install pydub`)
- `ffmpeg` or `libav`: Required backend for `pydub` to handle MP3 export (install via `pacman -S ffmpeg` on Arch Linux)

### Description

This script translates a GRUB/GRUB2-style `GRUB_INIT_TUNE` string into an audio file. GRUB allows specifying a boot-time tune using the format:  
```
TEMPO [FREQ1 DURATION1 FREQ2 DURATION2 ...]
```
Where:
- **TEMPO** is measured in beats per minute (BPM)
- **FREQ** is the frequency of the note in Hz
- **DURATION** is the relative length of the note, in beats

The script parses this string, individually generates each tone using the frequency and duration specified, and concatenates them to form the full sequence. The final result is saved as `output.mp3` in the current directory.

#### Core Functions

- `grub_tune_to_audio(tune_string)`:  
  - Parses the input string
  - Calculates duration per beat
  - Iteratively constructs tones for each note with the correct frequency and duration
  - Concatenates tones into a single `AudioSegment`

### Usage

Example (you can run directly in the terminal):

```bash
python /home/matias/.scripts/bin/grub-tune-to-audio-python.py "480 880 2 988 2 1047 4"
```

This would produce a tune at 480 BPM, playing 880Hz for 2 beats, 988Hz for 2 beats, and 1047Hz for 4 beats.  
Output is always an MP3 named `output.mp3` in the script's working directory.

**TL;DR**
1. Supply a GRUB tune string as a single quoted argument.
2. The resulting tune is saved as `output.mp3`.

### Integration with Qtile or automation

- You can bind this script to a key or menu in Qtile to quickly generate audio for GRUB tunes.
- Since there's no GUI, it is suitable for CLI/terminal usage or quick keybind execution.

---

> [!TIP]
>
> - The script lacks error checking for malformed GRUB tune strings (e.g., missing or extra values, invalid numbers).  
> - Output filename is always `output.mp3` and will be overwritten with each use—consider adding an option to set the output name.  
> - Only MP3 is supported, dependent on `ffmpeg` or `libav`. If those are missing or misconfigured, the script will fail.  
> - No playback functionality—consider adding an option to automatically play the generated audio for immediate feedback.  
> - Parameter parsing could be extended to support more complex `GRUB_INIT_TUNE` syntaxes or validation.  
> - For frequent use, a shell wrapper or integration with your existing workflow (Qtile dmenu, rofi script, etc.) may speed things up.