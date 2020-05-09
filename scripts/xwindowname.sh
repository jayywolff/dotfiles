#! /bin/bash
while true
do
  if (xdotool getwindowfocus getwindowname | grep 'tmux')
  then
    echo $(tmux list-windows | grep '(active)' | awk '{print $2}' | sed 's/\*//')
  else
    echo $(xdotool getwindowfocus getwindowname | cut -c1-40)
  fi
  sleep 0.5
done
