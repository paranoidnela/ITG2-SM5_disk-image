#!/bin/sh
for card in $(aplay -l | grep card | awk '{print $2}' | sed 's/://'); do
    amixer -c $card sset Master unmute
    amixer -c $card sset Master 90%
done