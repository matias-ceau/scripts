# Grub Tune to Audio Converter

---

**grub-tune-to-audio-python.py**: Converts GRUB tune strings into audio files.

---

### Dependencies

- `pydub`: A library for audio processing, used to generate and manipulate audio segments.
- `pydub.generators`: Provides sound wave generation capabilities, like sine waves.
- Recommended: `FFmpeg` or `libav` for handling MP3 exporting, as `pydub` leverages these tools for audio file format conversion. These should be installed on your Arch Linux system.

### Description

The script takes a GRUB tune string and converts it into an audio file (MP3 format). The input string is expected to be in the format typically used by `GRUB_INIT_TUNE`, with the first number representing the tempo (in beats per minute), followed by pairs of numbers representing each note's frequency (in Hz) and its duration in beats.

It calculates the beat's duration in milliseconds, constructs audio segments for each note using sine wave generation, and then combines these into a single audio output.

### Usage

The script is designed to be run from the command line with the following syntax:

```sh
python grub-tune-to-audio-python.py "<GRUB_INIT_TUNE string>"
```

- **Example**: To convert a tune `390 440 1 460 2` (where `390` is the tempo, and subsequent pairs represent frequency and beats), use:

  ```sh
  python grub-tune-to-audio-python.py "390 440 1 460 2"
  ```

Once executed, it produces an `output.mp3`, saved in the current working directory.

This script can be run directly in the terminal or integrated into other larger scripts or tasks that require converting tune strings to audio, possibly assigning it to a keybinding in qtile for quick access.

---

> [!TIP]
> Currently, the script only supports output in MP3 format. Consider implementing support for additional formats like WAV for more flexibility. Additionally, including error handling for non-integer values in the input string could enhance robustness.