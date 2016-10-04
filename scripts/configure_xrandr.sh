#! /bin/bash

# This script is basically a toggle switch between my most used monitor setups

LAPTOP="eDP-1"
HDMI="HDMI-1"

if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
    xrandr --output $HDMI --auto --right-of $LAPTOP
    # Force work monitor into 1920x1080 mode
    if (xrandr | grep "$HDMI connected 1440x900+1920+0"); then
        xrandr --output $HDMI --mode 1920x1080
    fi
elif (xrandr | grep "$HDMI disconnected" && xrandr | grep "$LAPTOP connected"); then
	xrandr --output $HDMI --off
	xrandr --output $LAPTOP --primary --auto
else # Reset and default to only laptop display, manually config other setups
	xrandr --output $HDMI --off
	xrandr --output $LAPTOP --off
	xrandr --output $LAPTOP --primary --auto
fi

i3-msg restart
