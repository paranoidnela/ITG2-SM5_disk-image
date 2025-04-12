#!/bin/sh
# this file should be left empty unless your monitor doesn't run at the correct refresh rate or resolution
# this file can only help you if the xrandr output in an xorg session looks sane, otherwise you might be missing gpu drivers
# example commands you'd put in here:
# xrandr --newmode "1280x720_60.00" 74.5 1280 1344 1472 1664 720 723 728 748 -HSync +VSync
# xrandr --addmode HDMI-1 "1280x720_60.00"
# xrandr --output HDMI-1 --mode "1280x720_60.00"
# command cvt $WIDTH $HEIGHT $REFRESH_RATE can spit out a valid modeline
# comand xrandr (inside an xorg session, for testing you can comment out the existing exec in ~/xinitrc and add a `exec xterm` line so that you can find your output name)
