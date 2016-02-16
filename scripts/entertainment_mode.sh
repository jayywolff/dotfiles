#!/bin/bash
xrandr --output HDMI-1 --mode 1680x1050 --output eDP-1 --off
xset s off #Disable default xscreensaver after 10 minutes
xset -dpms #Disable default standby, hibernate, after 10 minutes
