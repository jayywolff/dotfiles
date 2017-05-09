#! /bin/bash

tmux start-server \; new-session -d
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
tmux send-keys -t 2 "neofetch" Enter
tmux attach-session
