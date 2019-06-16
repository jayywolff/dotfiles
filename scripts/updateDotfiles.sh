#!/bin/bash
dotdir="$HOME/dotfiles"

mkdir -p $HOME/.config/ranger && ln -sf $dotdir/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
mkdir -p $HOME/.config/htop && ln -sf $dotdir/.config/htop/htoprc $HOME/.config/htop/htoprc
mkdir -p $HOME/.config/termite && ln -sf $dotdir/.config/termite/config $HOME/.config/termite/config
#mkdir -p $HOME/.config/gtk-3.0 && ln -sf $dotdir/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
rm -rf $HOME/.config/i3 && ln -sf $dotdir/.config/i3 $HOME/.config/i3
ln -sf $dotdir/.config/feh $HOME/.config/feh
ln -sf $dotdir/.config/mupen64plus $HOME/.config/mupen64plus
ln -sf $dotdir/.config/compton.conf $HOME/.config/compton.conf
ln -sf $dotdir/.zshrc $HOME/.zshrc
ln -sf $dotdir/.Xresources $HOME/.Xresources
ln -sf $dotdir/.editrc $HOME/.editrc
ln -sf $dotdir/.editorconfig $HOME/.editorconfig

## setup vim
ln -sf $dotdir/.vim/ $HOME/.vim
ln -sf $dotdir/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/backups
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 $dotdir/.vim/bundle/YouCompleteMe/install.py


# setup tmux
ln -sf $dotdir/.tmux.conf $HOME/.tmux.conf 
mkdir -p $HOME/.tmux/plugins
if "test ! -d ~/.tmux/plugins/tpm" "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"
tmux source $HOME/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

# lightdm setup
#sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.old.conf
#sudo ln -f $dotdir/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
#sudo chown root /etc/lightdm/lightdm-gtk-greeter.conf

#setup zsh (must open a new terminal to finish zsh setup)
sudo chsh -s /bin/zsh $USER

# misc directories to be created
mkdir -p $HOME/Dev
mkdir -p $HOME/Pictures/screenshots
