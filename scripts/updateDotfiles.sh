#!/bin/bash

dotdir="$HOME/dotfiles"

ln -sf $dotdir/.i3/ $HOME/.i3 
ln -sf $dotdir/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sf $dotdir/.config/htop/htoprc $HOME/.config/htop/htoprc
ln -sf $dotdir/.config/termite/config $HOME/.config/termite/config
ln -sf $dotdir/.config/feh $HOME/.config/feh
ln -sf $dotdir/.config/mupen64plus $HOME/.config/mupen64plus
ln -sf $dotdir/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
ln -sf $dotdir/.gtkrc-2.0 $HOME/.gtkrc-2.0
ln -sf $dotdir/.zshrc $HOME/.zshrc
ln -sf $dotdir/.Xresources $HOME/.Xresources
ln -sf $dotdir/.irssi/config $HOME/.irssi/config

#setup vim
ln -sf $dotdir/.vim/ $HOME/.vim
ln -sf $dotdir/.vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 $dotdir/.vim/bundle/YouCompleteMe/install.py


# setup tmux
ln -sf $dotdir/.tmux.conf $HOME/.tmux.conf 
if "test ! -d ~/.tmux/plugins/tpm" "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"
tmux source $HOME/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

#etc files
sudo ln -f $dotdir/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo chown root /etc/lightdm/lightdm-gtk-greeter.conf

#setup zsh (must open a new terminal to finish zsh setup 
sudo chsh -s /bin/zsh $USER
