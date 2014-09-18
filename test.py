import os
from pyomxplayer import OMXPlayer

self.loop1= OMXPlayer('/home/pi/videos/background.mp4', '-o local’, start_playback=True)
self.loop2 = OMXPlayer('/home/pi/videos/Nature.mp4', '-o local’, start_playback=True)
self.loop2.toggle_pause()

position = self.loop1.position/1000000
if position > 12.8:
    self.loop1.toggle_pause()

sleep(2)
os.system('pkill -9 -f "/usr/bin/omxplayer.bin -s /home/pi/videos/background.mp4 -o local"’)os.system('pkill -9 -f "/bin/bash /usr/bin/omxplayer -s /home/pi/videos/background.mp4 -o local"’)
sleep(2)
self.loop1= OMXPlayer('/home/pi/videos/background.mp4', '-o local’, start_playback=True)
self.loop1.toggle_pause()
