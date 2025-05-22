# Speech to Text Audio Transcriber

---

**speach-to-text.py**:  
Python script for recording audio via a selected device and transcribing it to text using OpenAI Whisper.

---

### Dependencies

- `openai`  
  Python package to access the OpenAI API (used for sending audio to Whisper).
- `scipy`  
  For writing WAV files to disk.
- `sounddevice`  
  For capturing audio from microphone/audio input.
- `uv`  
  Used as the fast Python package runner (see shebang).
- Python >= 3.13

### Description

This script offers a minimal, interactive solution to record your speech (or any audio) through a selected audio device, and get it transcribed using the OpenAI Whisper API.

#### Main Features:
- Defaults to the device "UMC202HD 192k: USB", or prompts you to choose an input device.
- Records up to 30 seconds of mono audio, sample rate at 48 kHz.
- Recording stops when you press Enter (`<CR>`).
- Audio is saved temporarily as `temp.wav`.
- Uses the OpenAI Python SDK to transcribe the wav file with the `whisper-1` model and prints the result to stdout.

#### Functions:
- **record_or_abort()**: Handles live, interactive recording and writes to disk.
- **transcribe()**: Uploads the file and outputs the transcription.

### Usage

**tldr:**

```sh
# You probably want to run this interactively from your default terminal:
~/.scripts/bin/speach-to-text.py

# Or bind it in your qtile config to a keypress, using:
lazy.spawn("~/.scripts/bin/speach-to-text.py")
```

#### Steps:
1. If your audio device is not "UMC202HD 192k: USB", you'll be prompted to select a device by index.
2. Speak/record after the prompt. Press Enter to stop before 30s.
3. Wait for transcription to print (network connection required for OpenAI API).
4. Check the prompt for your recognized speech.

*Requires your OpenAI API key to be configured in your environment* (see OpenAI Python SDK docs).

---

> [!NOTE]
> - Typo in script name (`speach-to-text.py` → `speech-to-text.py` recommended).
> - Device selection logic could be improved for robustness (e.g., safe integer parsing and device validation).
> - No automatic deletion of `temp.wav`, so temp files may accumulate.
> - No error handling if OpenAI API fails, or if network is absent.
> - Consider making duration/config parameters customizable by CLI arguments.
> - Prompt is minimal (`<CR> to stop`), but could be more user-friendly.
> - Would benefit from a notification about where to set the OpenAI API key.
> - For qtile integration, check that the script does not require terminal input if assigning to a keybinding.