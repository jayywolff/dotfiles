#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias dbeaver='GTK2_RC_FILES=/usr/share/themes/Adwaita/gtk-2.0/gtkrc dbeaver'
PS1='[\u@\h \W]\$ '
