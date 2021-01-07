#! /bin/bash

tmux start-server \; new-session -d
tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
tmux attach-session -t d3v
