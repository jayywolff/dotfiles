#! /bin/env bash

# A basic script for toggling on and off i3-gaps

# simply add this line to your i3-config file to use
# bindsym $mod+g exec bash ~/dotfiles/scripts/i3_gaps.sh

tmp_file="/tmp/.i3-gaps"

if [ ! -e "$tmp_file" ]; then
    touch $tmp_file
    i3-msg gaps inner all set 0
else
    rm $tmp_file
    i3-msg gaps inner all set 35
fi
