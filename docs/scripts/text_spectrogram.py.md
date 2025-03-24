# text_spectrogram.py Spectrogram Viewer

---

**text_spectrogram.py**: Show a text-mode spectrogram using live microphone data

---

### Dependencies

- `python3` – The Python interpreter.
- `numpy` – Provides array operations and FFT computations.
- `sounddevice` – For accessing the microphone and handling audio streams.
- `argparse` – For command-line argument parsing.
- `shutil` – To determine current terminal size.
- `math` – For various mathematical calculations.

### Description

This Python script creates an interactive text-mode spectrogram by capturing live microphone input. It employs the Fast Fourier Transform (FFT) from the `numpy` library to compute frequency magnitudes in real time, displaying the results as colored text output in the terminal. The script sets up an audio input stream with `sounddevice` and continually processes incoming data in chunks, calculating the relevant frequency bins based on user-defined low and high frequency limits.

The spectrogram is rendered using ANSI escape sequences to create a colorful gradient, which visually enhances the frequency intensity display. An initial gain factor can be set to scale the magnitude of the FFT output. The script uses a callback function to process each block of audio data, transforming the samples into a line of gradient characters that represent the audio spectrum. Additionally, it supports interactive adjustments: pressing "+" or "-" (followed by Enter) will double or halve the gain, respectively, while pressing Enter or "q" quits the application. It also contains a command-line option to list available audio devices, making it easier to select the proper input source.

### Usage

Run the script from a terminal in your Arch Linux environment with qtile:

  
  ./text_spectrogram.py

  
Interactive commands within the script:
  
  - Press <Enter> or type "q" followed by <Enter> to quit.
  - Use "+" or "-" keys (with <Enter>) to adjust gain.

  
Common command-line arguments include:

  
  - List audio devices:
    
      ./text_spectrogram.py --list-devices
  
  - Set custom block duration (in milliseconds):
  
      ./text_spectrogram.py --block-duration 100
  
  - Define the spectrogram width:
  
      ./text_spectrogram.py --columns 120
  
  - Select the input device (ID or substring):
  
      ./text_spectrogram.py --device 1
  
  - Adjust initial gain:
  
      ./text_spectrogram.py --gain 20
  
  - Specify a frequency range:
  
      ./text_spectrogram.py --range 50 3000

---

> [!TIP]
> Consider enhancing error handling for cases when terminal size cannot be determined or when the selected audio device is invalid. Further customizations, such as additional color schemes or more flexible keybindings, could improve user experience. Additionally, a more detailed help message could be beneficial for users unfamiliar with spectrogram terminology.  
