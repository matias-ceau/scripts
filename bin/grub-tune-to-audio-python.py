#! /usr/bin/env python

import sys
from pydub import AudioSegment
from pydub.generators import Sine

def grub_tune_to_audio(tune_string):
    # Parse the GRUB_INIT_TUNE string
    params = [int(x) for x in tune_string.split()]
    # Extract the tempo (first number in the string)
    tempo = params[0]
    # Calculate the duration of a single beat in milliseconds
    beat_duration = 60000 / tempo  # 60000 ms in a minute
    # Create an empty audio segment
    audio = AudioSegment.silent(duration=0)
    # Process each note in the tune
    for i in range(1, len(params), 2):
        freq = params[i]
        beats = params[i+1]
        # Calculate the duration of this note
        duration = int(beat_duration * beats)
        # Generate the tone
        tone = Sine(freq).to_audio_segment(duration=duration)
        # Add the tone to the audio
        audio += tone
    return audio

def main():
    if len(sys.argv) != 2:
        print('Usage: python script.py "<GRUB_INIT_TUNE string>"')
        sys.exit(1)
    tune_string = sys.argv[1]
    audio = grub_tune_to_audio(tune_string)
    # Export as MP3
    audio.export("output.mp3", format="mp3")
    print("MP3 file 'output.mp3' has been created.")

if __name__ == "__main__":
    main()
