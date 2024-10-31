# Speech to Text Script

---

**speach-to-text.py**: Record audio and transcribe it using OpenAI's Whisper model

---

### Dependencies

- `sounddevice`: Used for audio recording.
- `openai`: Accesses OpenAI API for transcription.
- `scipy.io.wavfile`: Writes the recorded audio to a WAV file.

### Description

This script is designed for users looking to transcribe spoken audio into text using OpenAI's Whisper model. The script records audio using the `sounddevice` library, saving temporary `WAV` files using `scipy.io.wavfile`, and then transcribes them with OpenAI's `Whisper` model via the `openai` library.

- **Audio Device Selection:** It checks if a preferred device (`UMC202HD 192k: USB`) is available, defaulting to manual selection if not.
- **Recording:** It captures audio for a maximum of 30 seconds. Recording can be manually stopped by pressing the **Enter** key.
- **File Handling & Transcription:** Once recorded, the file is saved and sent to OpenAI for transcription. The transcription is then printed to the standard output.

### Usage

To use this script, ensure you have configured API access for OpenAI.

```bash
python /home/matias/.scripts/bin/speach-to-text.py
```

1. The script will check for the preferred audio device or prompt for selection.
2. Audio will be recorded for up to 30 seconds, or until the **Enter** key is pressed.
3. The recorded audio is saved as `temp.wav`.
4. Transcription is automatically performed and displayed in the terminal.

---

> [!TIP]
> - **Error Handling:** The script assumes the preferred device name is always accurate. Adding error handling for invalid device names or indices can make selection more robust.
> - **Device Querying:** This process could be improved with a custom function to verify connected devices and return more user-friendly messages.
> - **Transcription Validation:** Consider implementing checks to handle API errors or empty transcriptions, ensuring they don't unduly interfere.
> - **Default File Handling:** Utilize a unique naming strategy for temporary files to avoid potential overwrites and conflicts.