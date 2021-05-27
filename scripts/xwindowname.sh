#! /bin/zsh

if [[ $(xdotool getwindowfocus getwindowname | cut -c1-40) == "i3" ]]
then
  echo "i3"
else
  WIN=$(xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}")) || echo "error"
  WINDOW_CLASS=$(echo $WIN | awk '/WM_CLASS/{print $4}' | tr --delete \")
  WINDOW_NAME=$(echo $WIN | awk '/WM_NAME\(STRING\)/{print $3}')

  if [[ $WINDOW_CLASS == "Alacritty" ]] && [[ $WINDOW_NAME =~ "tmux" ]]
  then
    echo $(tmux list-windows | grep '(active)' | cut -f1 -d'*' | sed 's/[0-9]: //')
  else
    echo $WINDOW_CLASS
  fi
fi
