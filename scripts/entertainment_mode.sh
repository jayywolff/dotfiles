#!/bin/bash
xrandr --output HDMI2 --mode 1680x1050 --output eDP1 --off --output HDMI1 --off
xset s off #Disable default xscreensaver after 10 minutes
xset -dpms #Disable default standby, hibernate, after 10 minutes
pkill compton
pkill redshift
i3-msg restart

#todo set volume to hdmi output
