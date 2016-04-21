#!/bin/bash
xrandr --output eDP-1 --primary --output eDP-1 --left-of HDMI-1
cvt 1680 1050
xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
xrandr --addmode HDMI-1 1680x1050_60.00
xrandr --output HDMI-1 --mode 1680x1050_60.00 --right-of eDP-1
feh --bg-scale ~/Pictures/wallpaper.*
xset s off
xset -dpms

