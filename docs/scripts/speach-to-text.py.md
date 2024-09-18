# Speech to Text Converter

---

**speach-to-text.py**: A script to record audio and transcribe it using OpenAI's Whisper model.

---

### Dependencies

- `sounddevice`: A library for recording and playing sound using NumPy arrays.
- `openai`: The OpenAI Python client library to interface with OpenAI's services.
- `scipy`: A scientific computation library, used here to write the recorded audio to a WAV file.

### Description

This Python script allows users to record audio from a specified input device and transcribe it using OpenAI's Whisper model. 

1. **Audio Recording**: The script initializes the audio recording parameters such as sample rate and channels. It checks for the preferred audio device and allows users to select another if their device isn't available.
  
2. **Audio Input Handling**: The `record_or_abort` function records audio in a loop and lets users abort the recording by pressing <CR>. It saves the recorded audio as a temporary WAV file.

3. **Transcription**: The saved audio file is then read and sent to the OpenAI API for transcription using the `transcribe` function. The transcribed text is printed to the console.

### Usage

To use this script, follow these steps:

1. Ensure you have the required dependencies installed:
   ```bash
   pip install sounddevice openai scipy
   ```

2. Run the script in your terminal:
   ```bash
   python /home/matias/.scripts/speach-to-text.py
   ```

3. Follow the on-screen prompts to select your audio input device if necessary. Record your speech, and when you wish to stop recording, press the <CR> key.

4. After recording, the script will automatically transcribe the audio and display the text in the terminal.

---

> [!TIP]  
> The script currently saves the audio file as `temp.wav`, which may lead to a conflict if the script is executed multiple times in quick succession. Consider implementing a mechanism to handle existing files (e.g., using a timestamp in the filename or deleting the file after processing). Additionally, error handling for audio device selection and file operations could improve script robustness.