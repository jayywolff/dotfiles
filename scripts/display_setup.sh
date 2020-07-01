#!/bin/bash
HDMI1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI-1)"
HDMI2="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI-2)"
HDMI3="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI-3)"

pkill picom
if [[ ! -n $HDMI1 ]] && [[ ! -n $HDMI2 ]] && [[ ! -n $HDMI3 ]] # Single monitor setup
then
    xrandr --output HDMI-1 --off --output HDMI-2 --off --output HDMI-3 --off --output eDP-1 --primary --mode 1920x1200
elif [[ -n $HDMI1 ]] && [[ -n $HDMI2 ]] && [[ ! -n $HDMI3 ]] # Dual monitor setup with HDMI1 and HDMI2
then
    xrandr --output HDMI-1 --mode 1920x1080 --primary --output HDMI-2 --mode 1920x1080 --right-of HDMI-1 --output eDP-1 --off
elif [[ -n $HDMI1 ]] # Dual monitor setup with HDMI1 and EDP1
then
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-1 --mode 1920x1080 --right-of eDP-1 --output HDMI-2 --off --output HDMI-3 --off
elif [[ -n $HDMI2 ]] # Dual monitor setup with HDMI2 and EDP1
then
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-2 --mode 1920x1080 --right-of eDP-1 --output HDMI-1 --off --output HDMI-3 --off
elif [[ -n $HDMI3 ]] # Dual monitor setup with HDMI3 and EDP1
then
    xrandr --output eDP-1 --primary --mode 1920x1200 --output HDMI-3 --mode 1920x1080 --right-of eDP-1 --output HDMI-1 --off --output HDMI-2 --off
else # Fail-safe
    xrandr --output HDMI-1 --off --output HDMI-2 --off --output HDMI-3 --off --output eDP-1 --primary --mode 1920x1200
fi

sleep 1
picom --daemon --config ~/dotfiles/.config/picom.conf
sleep 0.5
i3-msg restart
