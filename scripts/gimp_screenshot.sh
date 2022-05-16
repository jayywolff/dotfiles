#! /bin/bash

# https://askubuntu.com/questions/717998/gimp-how-to-assign-a-keyboard-shortcut-to-screenshot-function

gimp --batch '(plug-in-screenshot RUN-INTERACTIVE FALSE 0 0 0 0 0)' --new-instance

sleep 2

xdotool mousemove --window `xdotool search --classname screenshot | tail -n 1` \
    $(xwininfo -id `xdotool search --classname screenshot | tail -n 1` \
    | sed -n -e "s/^ \+Width: \+\([0-9]\+\).*/\1/p" \
    -e "s/^ \+Height: \+\([0-9]\+\).*/\1/p" \
    | awk '{print $1-20}' | tr '\n' ' ') \
    click 1
