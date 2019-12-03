#!/bin/bash
xrandr --output HDMI-3 --mode 1920x1080 --primary --output eDP-1 --off
xset s off #Disable default xscreensaver after 10 minutes
xset -dpms #Disable default standby, hibernate, after 10 minutes
pkill picom
pkill redshift
sleep 2
i3-msg restart

#todo set volume to hdmi output
