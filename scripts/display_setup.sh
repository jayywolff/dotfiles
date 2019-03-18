#!/bin/bash
EDP1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP1)"
HDMI1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI1)"
HDMI2="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI2)"

if [[ ! -n $HDMI2 ]] && [[ ! -n $HDMI1 ]] # Single monitor setup
then
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --off --output HDMI2 --off
elif [[ -n $HDMI2 ]] && [[ ! -n $HDMI1 ]] # Dual monitor setup with HDMI
then
    echo $HDMI2
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI2 --mode 1920x1080 --left-of eDP1
elif [[ ! -n $HDMI2 ]] && [[ -n $HDMI1 ]] # Dual monitor setup with DVI
then
    echo $HDMI1
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --mode 1920x1080 --left-of eDP1
elif [[ -n $HDMI2 ]] && [[ -n $HDMI1 ]] # Triple monitor setup
then
    # only using 2 external monitors
    xrandr --output eDP1 --off --output HDMI2 --mode 1920x1080 --right-of HDMI1 --output HDMI1 --primary --mode 1920x1080

    # 2 external monitors & laptop display
    #xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI2 --mode 1920x1080 --right-of eDP1 --output HDMI1 --mode 1920x1080 --left-of eDP1
else # Fail-safe
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --off --output HDMI2 --off
fi

sleep 0.2
feh --bg-scale ~/Pictures/wallpaper.*
