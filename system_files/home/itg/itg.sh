#!/bin/sh
xset s off
xset -dpms
xset s noblank
~/video.sh
sudo mount -o remount,ro /mnt/Songs
~/stepmania/stepmania
sudo mount -o remount, rw /mnt/Songs