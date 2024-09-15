#!/usr/bin/python

import time

import sounddevice as sd
from openai import OpenAI
from scipy.io.wavfile import write

SAMPLE_RATE = 48_000
PREFERED_DEVICE = "UMC202HD 192k: USB"
DEVICE = (
    PREFERED_DEVICE
    if PREFERED_DEVICE in str(sd.query_devices())
    else int(input(f"{sd.query_devices()}\n Choose device by index: "))
)
MAX_RECORD_TIME = 30
CHANNELS = 1

WHISPER_MODEL = "whisper-1"


def record_or_abort():
    recording = sd.rec(
        MAX_RECORD_TIME * SAMPLE_RATE,
        samplerate=SAMPLE_RATE,
        channels=CHANNELS,
        device=DEVICE,
    )
    start_time = time.time()
    index = None
    while time.time() - start_time < MAX_RECORD_TIME:
        if input("<CR> to stop") == "":
            index = int((time.time() - start_time) * SAMPLE_RATE)
            sd.stop()
            break
    recording = recording[:index, :] if index else recording
    write("temp.wav", SAMPLE_RATE, recording)


def transcribe():
    client = OpenAI()
    audio_file = open("temp.wav", "rb")
    transcription = client.audio.transcriptions.create(
        model=WHISPER_MODEL, file=audio_file
    )
    print(transcription.text)


if __name__ == "__main__":
    record_or_abort()
    transcribe()
