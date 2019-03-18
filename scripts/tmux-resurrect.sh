#! /bin/bash

tmux start-server \; new-session -d
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
#tmux send-keys -t 1 "neofetch" Enter
tmux attach-session -t Dev
