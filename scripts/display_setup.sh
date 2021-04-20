#!/bin/bash
EDP1="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP1)"
DP21="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-1)"
DP22="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-2)"

if [[ ! -n $DP21 ]] && [[ ! -n $DP22 ]] # Single monitor setup
then
    xrandr --output eDP1 --primary --mode 1920x1080 --output DP2-1 --off --output DP2-2 --off
elif [[ -n $DP21 ]] && [[ -n $DP22 ]] # Dual monitor dock setup with HDMI and Display port
then
    xrandr --output DP2-1 --mode 1920x1080 --primary
    xrandr --output DP2-1 --mode 1920x1080 --primary --output DP2-2 --mode 1920x1080 --right-of DP2-1 --output eDP1 --off
else # Fail-safe
    xrandr --output eDP1 --primary --mode 1920x1080 --output DP2-1 --off --output DP2-2 --off
fi

sleep 0.2
i3-msg restart
sleep 0.2
pkill picom
picom --daemon --config ~/dotfiles/.config/picom.conf
