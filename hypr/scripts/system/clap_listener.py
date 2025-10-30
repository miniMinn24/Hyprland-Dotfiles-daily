import subprocess

import numpy as np
import pyaudio

# Define constants
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100  # Sample rate
CHUNK = 1024  # Buffer size
THRESHOLD = 20000  # Adjust based on your environment


def detect_snap(audio_data):
    """Check if the audio signal matches a finger snap"""
    peak = np.max(np.abs(audio_data))
    return peak > THRESHOLD


def run_bash_script():
    """Run the bash script when snap is detected"""
    subprocess.Popen(
        ["/home/miniminn/.config/hypr/scripts/wlogoutsh/lock.sh"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        stdin=subprocess.DEVNULL,
        start_new_session=True,
    )


def main():
    """Continuously listen for finger snap and trigger script"""
    pa = pyaudio.PyAudio()
    stream = pa.open(
        format=FORMAT, channels=CHANNELS, rate=RATE, input=True, frames_per_buffer=CHUNK
    )

    print("Listening for snap sound...")

    try:
        while True:
            data = np.frombuffer(
                stream.read(CHUNK, exception_on_overflow=False), dtype=np.int16
            )
            if detect_snap(data):
                print("Snap detected! Running script...")
                run_bash_script()
    except KeyboardInterrupt:
        print("Stopping...")
    finally:
        stream.stop_stream()
        stream.close()
        pa.terminate()


if __name__ == "__main__":
    main()
