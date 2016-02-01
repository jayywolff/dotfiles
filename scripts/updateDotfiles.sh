#!/bin/bash

homedir='/home/jay'
dotdir="$homedir/dotfiles"

ln -sf $dotdir/.i3/ $homedir/.i3 
ln -sf $dotdir/.config/ranger/rc.conf $homedir/.config/ranger/rc.conf
ln -sf $dotdir/.config/htop/htoprc $homedir/.config/htop/htoprc
ln -sf $dotdir/.config/gtk-3.0/settings.ini $homedir/.config/gtk-3.0/settings.ini
ln -sf $dotdir/.gtkrc-2.0 $homedir/.gtkrc-2.0
ln -sf $dotdir/.zshrc $homedir/.zshrc
ln -sf $dotdir/.Xresources $homedir/.Xresources
ln -sf $dotdir/.irssi/config $homedir/.irssi/config

#setup vim
ln -sf $dotdir/.vim/ $homedir/.vim
ln -sf $dotdir/.vimrc $homedir/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# /etc files
sudo ln -sf $dotdir/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo chown root /etc/lightdm/lightdm-gtk-greeter.conf
