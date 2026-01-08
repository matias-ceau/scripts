# Text-mode Microphone Spectrogram

---

**text_spectrogram.py**: Live terminal spectrogram from microphone input with adjustable gain

---

### Dependencies

- `python` (3.x)
- `numpy` (FFT + array ops)
- `sounddevice` (PortAudio bindings; provides `InputStream`, `query_devices()`)
- `portaudio` (system library used by `sounddevice`, Arch package typically `portaudio`)
- A terminal that supports ANSI 24-bit color escape sequences (for the gradient)

### Description

This script renders a real-time, text-mode spectrogram in your terminal using live microphone (or other input device) data.

It computes an FFT on each captured audio block and maps the magnitude values across a configurable frequency range to a colored character gradient. The output width is tied to the number of columns (`--columns`) and defaults to your current terminal width (via `shutil.get_terminal_size()`), making it handy for quick audio debugging directly in a shell.

Key implementation details:
- Device discovery: `--list-devices` prints `sounddevice`’s device table and exits.
- Frequency mapping: the script converts the requested `LOW..HIGH` Hz range to FFT bins (`delta_f`, `fftsize`, `low_bin`) so each printed column corresponds roughly to one frequency “slice”.
- Live control: during streaming, you can type `+` or `-` then press Enter to adjust the gain factor (doubling/halving), or just press Enter to quit.

### Usage

List audio devices (useful on Arch when device IDs change):
```bash
./text_spectrogram.py --list-devices
```

Run with defaults (range 100–2000 Hz, gain 10):
```bash
./text_spectrogram.py
```

Select a device and tune display width / range:
```bash
./text_spectrogram.py -d 2 -c 120 -r 50 8000
```

Adjust responsiveness (block duration in ms):
```bash
./text_spectrogram.py -b 25
```

Interactive controls (while running):
- `+<Enter>` increase gain
- `-<Enter>` decrease gain
- `<Enter>` / `q<Enter>` quit

---

> [!TIP]
> Consider switching from `input()` to non-blocking key reads (e.g., `curses` or `termios`) so the UI doesn’t require Enter. Also, printing every FFT line without throttling can flood scrollback; you may want to clear/redraw in-place (ANSI cursor control) for a stable “live view”. Finally, guard against very small `--columns` (division by zero when `columns-1`) and consider a window function (Hann) to reduce spectral leakage.