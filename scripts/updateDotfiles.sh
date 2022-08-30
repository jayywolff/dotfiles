#!/bin/bash
dotdir="$HOME/dotfiles"

mkdir -p $HOME/.config/ranger && ln -sf $dotdir/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
rm -rf $HOME/.config/i3 && ln -sf $dotdir/.config/i3 $HOME/.config/i3
ln -sf $dotdir/.config/alacritty $HOME/.config/alacritty
ln -sf $dotdir/.config/polybar $HOME/.config/polybar
ln -sf $dotdir/.config/fontconfig $HOME/.config/fontconfig
ln -sf $dotdir/.config/feh $HOME/.config/feh
ln -sf $dotdir/.config/mupen64plus $HOME/.config/mupen64plus
ln -sf $dotdir/.config/picom.conf $HOME/.config/picom.conf
ln -sf $dotdir/.zshrc $HOME/.zshrc
ln -sf $dotdir/.profile $HOME/.profile
ln -sf $dotdir/.Xresources $HOME/.Xresources
ln -sf $dotdir/.editrc $HOME/.editrc
ln -sf $dotdir/.inputrc $HOME/.inputrc
ln -sf $dotdir/.pryrc $HOME/.pryrc
ln -sf $dotdir/.editorconfig $HOME/.editorconfig

## setup vim
ln -sf $dotdir/.vim/ $HOME/.vim
ln -sf $dotdir/.vimrc $HOME/.vimrc
mkdir $dotdir/.vim/backups
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# there may be some un-automated setup required for coc-vim
vim -c 'CocInstall -sync coc-json coc-html coc-css coc-phpactor coc-tsserver|q'

# setup tmux
ln -sf $dotdir/.tmux.conf $HOME/.tmux.conf 
mkdir -p $HOME/.tmux/plugins
if "test ! -d ~/.tmux/plugins/tpm" "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"
tmux source $HOME/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

# lightdm setup (manually)
#sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.old.conf
#sudo cp $dotdir/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
#sudo chown root:root /etc/lightdm/lightdm-gtk-greeter.conf
#sudo vim /etc/lightdm/lightdm.conf 
#change `#display-setup-script=` to `display-setup-script=/usr/share/setup-monitors.sh`
#sudo vim /usr/share/setup-monitors.sh
#make this a bash script that sets up xrandr

#setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# misc directories to be created
mkdir -p $HOME/Dev
mkdir -p $HOME/Pictures/screenshots

# other notes
# check out https://wiki.archlinux.org/index.php/Font_configuration
# set application defaults
# https://wiki.archlinux.org/title/Xdg-utils#Usage
# xdg-mime query default inode/directory
# xdg-mime default pcmanfm.desktop inode/directory
