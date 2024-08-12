# Grub Tune to Audio Generator

---

**grub-tune-to-audio-python.py**: Converts GRUB_INIT_TUNE strings into audio files.

---

### Dependencies

- `pydub`: A simple and easy-to-use audio manipulation library. It is required for working with audio segments and generating tones.

### Description

This script allows you to convert a GRUB_INIT_TUNE string into an audio MP3 file. The GRUB_INIT_TUNE format encodes a melody that GRUB plays during boot. The script utilizes the `pydub` library to generate tones based on the frequencies and durations specified in the tuning string. 

The `grub_tune_to_audio` function processes the tune string, converts it to a series of audio segments, and combines these segments into a single audio file. The duration of each note is calculated based on the specified tempo. 

#### How it Works:
1. **Input**: The script accepts a single command-line argument, which is the GRUB_INIT_TUNE string.
2. **Parsing**: It splits the input string and extracts the tempo and subsequent frequency-beat pairs.
3. **Tone Generation**: For each frequency and its corresponding beat duration, it generates a sound tone using a sine wave.
4. **Export to MP3**: Finally, it exports the combined audio segments to an MP3 file named `output.mp3`.

### Usage

To run this script, use the following command in your terminal:

```bash
python grub-tune-to-audio-python.py "<GRUB_INIT_TUNE string>"
```

#### Example:

Suppose you have a GRUB_INIT_TUNE string like `60 440 60 440 60 440 60 0`, you would execute the command as follows:

```bash
python grub-tune-to-audio-python.py "60 440 60 440 60 440 60 0"
```

After executing, it will generate an `output.mp3` file in the current directory, containing the audio representation of your GRUB_INIT_TUNE.

---

> [!TIP]  
> This script currently exports the audio as an MP3 file named `output.mp3` every time it runs. An improvement could be to allow users to specify the output file name as a command-line argument. Additionally, error handling can be incorporated to manage invalid tune strings better, enhancing the overall robustness of the script.