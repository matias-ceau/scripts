# GRUB Tune to Audio Generator

---

**grub-tune-to-audio-python.py**: Converts a GRUB initialization tune string to an MP3 audio file.

---

### Dependencies

- `pydub`: A Python library for manipulating audio with a simple and easy high-level interface. This script specifically uses it for generating sound tones and exporting audio files.
- `ffmpeg`: Required by `pydub` for audio export functionalities. Ensure it is installed on your system, as it handles various audio file formats.

### Description

This script takes a GRUB initialization tune string as input and converts it into an audio file in MP3 format. The GRUB initialization tune string generally follows the format:

```
<tempo> <frequency1> <beats1> <frequency2> <beats2> ...
```

Where:
- `<tempo>` - The speed of the tune measured in beats per minute.
- `<frequency>` - The frequency of the note in hertz (Hz).
- `<beats>` - The number of beats that note lasts.

The main function of the script is `grub_tune_to_audio`, which parses the input string, calculates the duration of each note, and then uses the `pydub` library to generate and compile the audio into a single track. The final audio is exported as `output.mp3`.

### Usage

To use this script, you must run it from the terminal with the GRUB tune string as an argument. Here’s how to do it:

1. Save the script as `grub-tune-to-audio-python.py` and ensure it is executable.
2. Open a terminal window and execute the script using the following command:

```bash
python grub-tune-to-audio-python.py "<GRUB_INIT_TUNE string>"
```

**Example:**

```bash
python grub-tune-to-audio-python.py "120 440 2 466 1 392 1"
```

This example generates a 120 BPM tune consisting of specific frequencies and their respective durations, resulting in the creation of an MP3 file named `output.mp3`.

---

> [!TIP] 
> The script lacks error handling for invalid input formats. Consider adding validation to ensure the input string is in the expected format to avoid crashes when parsing. Additionally, it would be beneficial to allow customization of the output file name instead of hardcoding `output.mp3`.