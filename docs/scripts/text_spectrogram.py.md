# Text-Mode Spectrogram (Live Microphone Viewer)

---

**text_spectrogram.py**: Live real-time text-based spectrogram using microphone input and ANSI colors.

---

### Dependencies

- `numpy`: Fast numeric array and FFT operations.
- `sounddevice`: Real-time microphone data acquisition.
- `shutil`: Terminal size detection.
- Standard Python modules: `math`, `argparse`.
- ALSA or PulseAudio (system dependency) support for audio input on Linux.
- Terminal with ANSI color support (most modern terminals, including those in Arch Linux environments).
- (Optional) qtile: Can be bound to a keybinding for quick access.

---

### Description

This script visualizes real-time audio frequencies from the default (or user-specified) microphone device as a colorful spectrogram directly in your terminal. 

**How it works:**
- Uses `sounddevice` to capture live audio data.
- Applies FFT (Fast Fourier Transform, via `numpy`) to obtain frequency/amplitude information.
- Draws the amplitude spectrum per block as a colored horizontal line using gradients of ANSI terminal color escapes (“heatmap” style).
- Configurable parameters let you:
    - Change frequency range (`--range`)
    - Adjust gain interactively (`+` to increase, `-` to decrease)
    - Set spectrogram width
    - Choose block duration (responsiveness vs. latency)
    - Select microphone device
    - List available input devices

The UI is minimalist, relying on “press <enter> to quit,” and responds to `+` and `-` for scaling.

---

### Usage

General usage in terminal:
```
python3 ~/.scripts/dev/text_spectrogram.py [options]
```
List audio devices first if needed:
```
python3 ~/.scripts/dev/text_spectrogram.py --list-devices
```
Set device by index or substring, and adjust frequency range:
```
python3 ~/.scripts/dev/text_spectrogram.py --device 2 --range 300 3500
```
Start with custom gain, width, or block duration:
```
python3 ~/.scripts/dev/text_spectrogram.py --gain 20 --columns 100 --block-duration 40
```
**During Execution:**
- `+` (then <enter>): Double gain/contrast.
- `-` (then <enter>): Halve gain/contrast.
- `<Enter>` or `q/Q`: Quit.

Example (good for qtile keybinding):
```
alacritty --class="SpectroTerm" -e python3 ~/.scripts/dev/text_spectrogram.py --range 200 4000
```

---

> [!TIP]
> - **User Experience:** Requires frequent keypresses for UI interaction, and printing to input blocks ongoing visualization (single-threaded: input() pauses spectrogram updates).
> - **Improvements:**
>   - Replace `input()` with non-blocking key listening (e.g., `curses` or `readchar`) for smooth, uninterrupted display.
>   - Optionally support stereo or more channels.
>   - Consider dynamic resizing based on terminal dimension changes (SIGWINCH).
>   - Add a persistent info/header/status bar.
> - **Performance:** Might experience lag on slow terminals or with large FFT sizes.
> - **Portability:** Hard requirement for color and Unicode support; basic shell or tmux sessions may render colors poorly.
> - **Exception Handling:** Good coverage, but consider graceful restart of the stream if device disconnects.
