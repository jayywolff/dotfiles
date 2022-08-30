#!/bin/bash
INTERNAL="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP1)"
LEFT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-1)"
RIGHT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-3)"

if [[ ! -n $LEFT ]] && [[ ! -n $RIGHT ]] # Single monitor setup
then
    xrandr --output eDP1 --mode 1920x1080 --primary 
    xrandr --output DP2-1 --off 
    xrandr --output DP2-3 --off
elif [[ -n $LEFT ]] && [[ -n $RIGHT ]] # Dual monitor dock setup with HDMI and Display port
then
    xrandr --output DP2-1 --mode 1920x1080 --primary 
    xrandr --output DP2-3 --mode 1920x1080 --right-of DP2-1
    xrandr --output eDP1 --off
else # Fail-safe
    xrandr --output eDP1 --mode 1920x1080 --primary --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off
fi

~/dotfiles/scripts/toggle_gaps.sh 1

# triple display setup
# xrandr --output DP2-1 --mode 1920x1080 --primary --output DP2-3 --mode 1920x1080 --right-of DP2-1 --output eDP1 --off --output DP2-2 --mode 1920x1080 --right-of DP2-3
