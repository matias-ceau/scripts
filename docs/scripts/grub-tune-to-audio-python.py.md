# GRUB Tune to Audio Converter

---

**grub-tune-to-audio-python.py**: Script to convert GRUB_INIT_TUNE string to an audio file (MP3 format)

---

### Dependencies

- `pydub`: This library is used to process audio, create tones, and export them to different audio formats.
- `ffmpeg` or `libav`: Required for the `pydub` library to handle audio encoding and decoding.

### Description

This script provides a utility to convert GRUB's `GRUB_INIT_TUNE` strings into actual audio files. The `GRUB_INIT_TUNE` is typically used to signal boot events with specific beeps; however, this script enables listening to these tunes outside of a boot loader environment by generating an MP3 file from the specified tune string.

The core function, `grub_tune_to_audio`, interprets the tune string by extracting the tempo and note parameters, and for each note, it calculates its duration based on the beats and tempo. It utilizes the `pydub` library's `Sine` wave generator to create the audio for each note, which are then concatenated into a single audio segment.

### Usage

The script is executed via the command line and expects a single argument: the `GRUB_INIT_TUNE` string.

```bash
$ python /home/matias/.scripts/grub-tune-to-audio-python.py "120 440 4 330 2"
```

This command will generate an MP3 file named `output.mp3` in the current directory with the specified tones.

#### Example

- **Input**: A `GRUB_INIT_TUNE` string like `"120 440 4 330 2"`
- **Output**: An `output.mp3` file containing the converted audio sequence based on the input string.

---

> [!TIP]
> One potential improvement is to allow users to specify the output filename instead of defaulting to `output.mp3`. Also, ensuring the user has `ffmpeg` installed could be added to the script's checks to prevent runtime errors.