# GRUB Tune to Audio Generator

---

**grub-tune-to-audio-python.py**: Convert GRUB_INIT_TUNE strings to audio files.

---

### Dependencies

- `pydub`: A simple and easy-to-use library for audio manipulation. It requires `ffmpeg` or `libav` for full audio capabilities.

### Description

This Python script allows users to convert GRUB's `GRUB_INIT_TUNE` string format into an MP3 audio file. The `GRUB_INIT_TUNE` format specifies music in terms of a sequence of frequencies and respective durations. The script will parse this string, generate the corresponding tones using the `pydub` library, and save the final audio file as `output.mp3`.

The main function `grub_tune_to_audio` does the heavy lifting by:
1. Parsing the provided tune string into individual components.
2. Calculating the duration of each note based on the specified tempo.
3. Generating sine wave tones for each frequency and duration defined in the input string.

### Usage

To use this script, you'll need to run it from the terminal and provide a valid `GRUB_INIT_TUNE` string as an argument. Below is the basic command structure:

```bash
python grub-tune-to-audio-python.py "<GRUB_INIT_TUNE string>"
```

**Example usage**:

```bash
python grub-tune-to-audio-python.py "100 440 2 550 2 660 4"
```

This example translates to a tune with:
- 2 beats of 440 Hz
- 2 beats of 550 Hz
- 4 beats of 660 Hz

After running, it generates an MP3 file named `output.mp3` in the same directory.

---

> [!TIP]  
> The script currently only outputs MP3 files. It would be beneficial to add options for different audio formats (like WAV or OGG) based on user preferences. Additionally, consider adding error handling for invalid input formats to improve robustness.