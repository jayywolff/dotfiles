#!/bin/bash
EDP1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP1)"
HDMI1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI1)"
HDMI2="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI2)"

if [[ ! -n $HDMI1 ]] && [[ ! -n $HDMI2 ]] # Single monitor setup
then
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --off --output HDMI2 --off
elif [[ -n $HDMI1 ]] && [[ -n $HDMI2 ]] # Dual monitor setup with HDMI and mini display port
then
    #xrandr --output HDMI1 --mode 1920x1080 --output HDMI2 --primary --mode 1920x1080 --right-of HDMI1 --output eDP1 --off
    xrandr --output HDMI1 --mode 1920x1080 --primary --output HDMI2 --mode 1920x1080 --right-of HDMI1 --output eDP1 --off
elif [[ -n $HDMI1 ]] && [[ ! -n $HDMI2 ]] # Dual monitor setup with HDMI
then
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --mode 1920x1080 --right-of eDP1 --output HDMI2 --off
elif [[ ! -n $HDMI1 ]] && [[ -n $HDMI2 ]] # Dual monitor setup with mini display port
then
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI2 --mode 1920x1080 --right-of eDP1 --output HDMI1 --off
else # Fail-safe
    xrandr --output eDP1 --primary --mode 1920x1080 --output HDMI1 --off --output HDMI2 --off
fi

sleep 0.2
i3-msg restart
sleep 0.2
pkill picom
picom --daemon --config ~/dotfiles/.config/picom.conf
