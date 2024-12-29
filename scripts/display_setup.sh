#!/bin/bash
INTERNAL="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP1)"
LEFT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-1)"
RIGHT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-3)"
TV="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep -x DP1)"

if [[ ! -n $LEFT ]] && [[ ! -n $RIGHT ]] # Single monitor setup
then
    xrandr --output DP1 --off
    xrandr --output DP2-1 --off
    xrandr --output DP2-2 --off
    xrandr --output DP2-3 --off
    xrandr --output eDP1 --mode 1920x1080 --primary
elif [[ -n $LEFT ]] && [[ -n $RIGHT ]] && [[ -n $RIGHT ]] # Triple display setup with HDMI and Display port via dock and usbc-hdmi to TV
then
    xrandr --output eDP1 --off
    xrandr --output DP2-1 --mode 1920x1080 --primary
    xrandr --output DP2-3 --mode 1920x1080 --right-of DP2-1
    xrandr --output DP1 --mode 1920x1080 --right-of DP2-3
elif [[ -n $LEFT ]] && [[ -n $RIGHT ]] # Dual monitor dock setup with HDMI and Display port
then
    xrandr --output eDP1 --off
    xrandr --output DP2-2 --off
    xrandr --output DP1 --off
    xrandr --output DP2-1 --mode 1920x1080 --primary
    xrandr --output DP2-3 --mode 1920x1080 --right-of DP2-1
else # Fail-safe
    xrandr --output eDP1 --mode 1920x1080 --primary --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off
fi

pkill picom
killall -q polybar
sleep 0.5
i3-msg restart
sleep 0.5
picom --daemon --config ~/dotfiles/.config/picom.conf
