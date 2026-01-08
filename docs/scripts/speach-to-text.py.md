# Speech to Text (Whisper CLI recorder)

---

**speach-to-text.py**: Record audio from a chosen device and transcribe it with OpenAI Whisper

---

### Dependencies

- `uv` (script runner via shebang: `uv run --script`)
- `python>=3.13`
- `sounddevice` (records audio from an input device)
- `scipy` (writes the recorded buffer as a WAV via `scipy.io.wavfile.write`)
- `openai` (calls Whisper transcription API)
- OpenAI credentials (typically `OPENAI_API_KEY` exported in your shell/session)

### Description

This script is a small interactive “press Enter to stop” recorder that saves a temporary WAV file (`temp.wav`) and sends it to OpenAI’s Whisper endpoint for transcription.

Key behavior:

- Uses a fixed `SAMPLE_RATE` of `48000`, mono (`CHANNELS = 1`).
- Attempts to auto-select the audio input device by matching `PREFERED_DEVICE = "UMC202HD 192k: USB"` against `sd.query_devices()`.
  - If not found, it prints the full device list and prompts for an index interactively.
- Records up to `MAX_RECORD_TIME = 3000` seconds.
- The recording loop polls `input("<CR> to stop")`; hitting Enter stops recording and trims the buffer to the elapsed time.
- Writes `temp.wav` in the current working directory, then calls `client.audio.transcriptions.create(model="whisper-1", file=...)` and prints the resulting text to stdout.

This fits well as a terminal-driven utility on Arch (and can be launched from qtile keybindings that spawn a terminal).

### Usage

Run from a terminal (interactive):

```bash
cd /where/you/want/temp.wav
/home/matias/.scripts/bin/speach-to-text.py
```

If your preferred device is not detected, select one:

```text
<device list...>
Choose device by index: 12
```

Stop recording:

```text
<CR> to stop
# press Enter
```

Use in qtile (example idea): bind a key to spawn your terminal and run the script so you can interact with prompts.

---

> [!TIP]
> Consider using a non-blocking keypress/GUI trigger instead of repeated `input()` calls (it currently spams prompts and blocks). Also: `index` can be `None`, leading to writing the full preallocated buffer (mostly silence) if you never press Enter; better to always stop the stream cleanly or set a shorter default. Use a unique temp path (e.g. `/tmp/stt-XXXX.wav`) to avoid clobbering and handle cleanup. Finally, wrap file I/O in a context manager (`with open(...)`) and add error handling for missing `OPENAI_API_KEY` / network failures.