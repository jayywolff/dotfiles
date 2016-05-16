#! /bin/bash

#This script is basically a toggle switch between my most used setups
#built-in display only & built-in + external to the right
#Todo - also setup clamp-shell mode

LAPTOP="eDP-1"
HDMI="HDMI-1"

if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
    xrandr --output $HDMI --auto --right-of $LAPTOP
elif (xrandr | grep "$HDMI disconnected" && xrandr | grep "$LAPTOP connected"); then
	xrandr --output $HDMI --off
	xrandr --output $LAPTOP --primary --auto
else #reset and default to only laptop display, manually config other setups
	xrandr --output $HDMI --off
	xrandr --output $LAPTOP --off
	xrandr --output $LAPTOP --primary --auto
fi

