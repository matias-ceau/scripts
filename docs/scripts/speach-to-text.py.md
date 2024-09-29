# Speech to Text Script

---

**speach-to-text.py**: A Python script that records audio and transcribes it to text using OpenAI's Whisper.

---

### Dependencies

- `sounddevice`: Used for recording audio from the selected input device.
- `openai`: The OpenAI Python client library for accessing the Whisper model for transcription.
- `scipy`: Used for writing the recorded audio to a WAV file.

### Description

This script is designed to record audio input from a specified device, saving it temporarily as a WAV file, and then transcribing that audio file into text using OpenAI's Whisper model. The process is streamlined and user-friendly:

1. It checks for the preferred audio device and allows the user to select an alternative if necessary.
2. The script records up to 30 seconds of audio, which can be manually stopped by pressing the Enter key.
3. Once recording is complete, it saves the audio to a file named `temp.wav`.
4. The script then opens this file and utilizes the OpenAI client to transcribe the audio using the specified Whisper model, outputting the result to the console.

### Usage

To use this script, ensure that required dependencies are installed and you have access to the OpenAI API. 

Here’s a simple usage example of running the script:

```bash
python /home/matias/.scripts/speach-to-text.py
```

During its execution:
- It will prompt you to choose a device if the preferred device is not available.
- To stop recording before reaching the maximum time, simply press Enter.

Example output upon transcription:
```
Your transcribed text will be printed here.
```

---

> [!TIP] 
> Consider implementing error handling for scenarios such as:
> - The OpenAI API being unreachable or returning an error.
> - Handling unexpected audio input or device issues.
> This will enhance the robustness of your script and improve user experience.