#! /bin/bash 
sleep .3
xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) WM_CLASS | awk '{print $4}'

