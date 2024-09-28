# Speech to Text Script

---

**speach-to-text.py**: Records audio through a preferred device and transcribes it using OpenAI's Whisper.

---

### Dependencies

- `sounddevice`: For recording audio from a microphone.
- `scipy`: Used for audio file writing.
- `openai`: Provides access to OpenAI's transcription services.
  
### Description

This script is designed to record audio from a specified input device and transcribe it using OpenAI's Whisper model. The recording is limited to thirty seconds. It first attempts to use a preferred device (`UMC202HD 192k: USB`), or else it prompts for a device index. The actual recording duration might be shorter if stopped manually by entering a Carriage Return (`<CR>`). The audio is stored as a temporary WAV file before being sent for transcription. The result is printed directly to the terminal.

### Usage

1. **Run the script**: 
   ```bash
   python /home/matias/.scripts/speach-to-text.py
   ```

2. **Choose Device**: If your preferred device is unavailable, you'll be prompted to choose a device from a list.

3. **Stop Recording**: Manually stop the recording by pressing `<CR>` within 30 seconds.

4. **View Transcription**: The transcribed text will be displayed in the terminal.

This script can be run from a terminal and might be suitable for keybindings within qtile if you want quick access to transcription capabilities.

---

> [!IMPORTANT]
> The script is missing proper exception handling. If the preferred device isn't available, any errors during recording or transcription might crash the script. Consider adding error handling measures. Also, the `openai` client instantiation might need API configuration, which isn't visible in the script. Make sure to set up your environment with the necessary authentication details.