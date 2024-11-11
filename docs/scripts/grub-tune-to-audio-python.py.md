# GRUB Tune to Audio Converter

---

**grub-tune-to-audio-python.py**: Converts a GRUB_INIT_TUNE string into an MP3 audio file using Python

---

### Dependencies

- `pydub`: A Python library to work with audio segments. It is used here to generate audio tones and process them.

### Description

This script takes a GRUB_INIT_TUNE string as input and generates an audio file in MP3 format from it. The GRUB_INIT_TUNE string comprises a series of numbers where the first number is the tempo (beats per minute), and the subsequent pairs represent frequency (in Hz) and duration (in beats). The script uses these parameters to create a sequence of audio tones that can be played back as an audio file.

The function `grub_tune_to_audio(tune_string)` processes the input string, extracting the tempo and converting each frequency and duration pair into an audio segment using the `pydub` library's `Sine` wave generator. It then combines these segments into a complete audio track.

### Usage

The script is designed to be run from the terminal with a single argument representing the GRUB_INIT_TUNE string. Execute it as follows:

```bash
python grub-tune-to-audio-python.py "<GRUB_INIT_TUNE string>"
```

#### Example:

```bash
python grub-tune-to-audio-python.py "120 440 4 622 4 660 4"
```

This command will create an MP3 file named `output.mp3` in the current directory. The example tune string "120 440 4 622 4 660 4" indicates a tempo of 120 BPM and notes of frequencies 440 Hz, 622 Hz, and 660 Hz for 4 beats each.

---

> [!NOTE]
> The script requires `pydub` to be installed alongside `ffmpeg` or `libav` for handling audio conversion. On Arch Linux, ffmpeg can be installed via the package manager using `sudo pacman -S ffmpeg`.
>
> Additionally, it assumes the user has Python installed and configured properly in their environment, which, given the context (Arch Linux with qtile window manager), is likely but worth mentioning for completeness.
>
> An improvement could be handling more complex GRUB tune strings with pause or rest capability, enhancing the musicality of the generated audio output.