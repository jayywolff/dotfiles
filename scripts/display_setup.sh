#!/bin/bash
EDP1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP-1)"
HDMI1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI-1)"
HDMI2="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI-2)"

if [[ ! -n $HDMI2 ]] && [[ ! -n $HDMI1 ]] # Single monitor setup
then
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-1 --off --output HDMI-2 --off
elif [[ -n $HDMI2 ]] && [[ ! -n $HDMI1 ]] # Dual monitor setup with DVI
then
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-2 --mode 1920x1080 --right-of eDP-1
elif [[ ! -n $HDMI2 ]] && [[ -n $HDMI1 ]] # Dual monitor setup with HDMI
then
    xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --left-of eDP-1
elif [[ -n $HDMI2 ]] && [[ -n $HDMI1 ]] # Triple monitor setup
then
    # only using 2 external monitors
    xrandr --output eDP-1 --off --output HDMI-2 --mode 1920x1080 --right-of HDMI-1 --output HDMI-1 --primary --mode 1920x1080

    # 2 external monitors & laptop display
    #xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-2 --mode 1920x1080 --right-of eDP-1 --output HDMI-1 --mode 1920x1080 --left-of eDP-1
else # Fail-safe
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-1 --off --output HDMI-2 --off
fi

sleep 0.2
feh --bg-scale ~/Pictures/wallpaper.*
sleep 0.2
pkill picom
picom --daemon --config ~/dotfiles/.config/picom.conf
