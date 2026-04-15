# Speech to Text (Whisper CLI)

---

**speach-to-text.py**: Record microphone audio and transcribe it using OpenAI Whisper

---

### Dependencies

- `uv` (shebang uses `uv run --script` to resolve deps and run)
- `python>=3.13`
- `sounddevice` — audio capture from your input device (PortAudio)
- `scipy` — writes a WAV file via `scipy.io.wavfile.write`
- `openai` — calls the Whisper transcription API
- A working audio backend (Arch: typically `pipewire` + `pipewire-pulse`) so `sounddevice` can access devices
- OpenAI credentials (e.g. `OPENAI_API_KEY` in your environment)

### Description

This script provides a minimal “push-to-stop” speech-to-text workflow:

1. It records mono audio at `48_000 Hz` from a preferred device named `UMC202HD 192k: USB`.
2. If that exact device string isn’t found in `sd.query_devices()`, it prints the full device list and prompts for an index.
3. Recording starts immediately and continues until you press Enter in the terminal (`<CR> to stop`) or until `MAX_RECORD_TIME` (3000s).
4. Audio is saved to `temp.wav` in the current working directory.
5. The WAV file is uploaded to OpenAI Whisper (`model="whisper-1"`) and the resulting text is printed to stdout.

Because it is interactive (uses `input()`), it’s best suited for running in a terminal scratchpad rather than a qtile keybinding—unless you spawn it inside a terminal.

### Usage

Run from a terminal:

    speach-to-text.py

If your preferred interface isn’t detected, choose the device index when prompted:

    <device list>
    Choose device by index: 3

Stop recording:

    <CR> to stop
    [press Enter]

Typical qtile usage (spawn in a terminal):

    alacritty -e /home/matias/.scripts/bin/speach-to-text.py

---

> [!TIP]
> Improvements to consider:
> - `input("<CR> to stop")` inside a loop blocks; you don’t actually “poll” time—recording just waits for Enter. A cleaner approach is to record continuously and stop on a single blocking `input()` (no loop), or use a non-blocking key listener.
> - `temp.wav` is overwritten and written to the CWD; use `tempfile.NamedTemporaryFile()` and/or a dedicated cache dir.
> - If you stop immediately, `index` may be very small; consider guarding against empty recordings and closing `audio_file` with a context manager.
> - Device matching by exact string is brittle; matching by substring or saving a config would be more robust on Arch/PipeWire.