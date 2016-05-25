#Jay's dotfiles
  
My dotfiles for: 
* i3-gaps
* i3-blocks
* zsh
* vim
* ranger
* lightdm
* gtk2 & gtk3
* git

Some configurations/keybindings are specific to Arch Linux and the keyboard of my thinkpad  
I need to clean out a lot of junk. This is a work in progress.  

##Current setup screenshot
![Screenshot] (http://i.imgur.com/WBf6UES.png)

##To recreate a minimal install with my current setup
  * Install Arch Linux or the headless install of Debian, Ubuntu, Fedora, OpenSuse, and even FreeBSD
  
  * Install x11, i3-gaps-git, lightdm, lightdm-gtk-greeter, gnome-terminal, rofi, i3status, i3-lock-wrapper, i3bar, i3blocks, gvim, compton-git, ranger, irssi, feh, zsh, zsh-completions, git, xdotool, nm-applet, powerline

  * Clone or copy dotfiles to ~/

  * Install fonts (FontAwesome, Powerline patched fonts, infinality-bundle(Arch only))

  * Change default shell to zsh, install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

  * adjust variables to your env in scripts/updateDotfiles.sh

  * `chmod +x ~/dotfiles/scripts/updateDotfiles.sh && bash ~/dotfiles/scripts/updateDotfiles.sh`

  * Setup vim by manually compiling YouCompleteMe `python2 ~/.vim/bundle/YouCompleteMe/install.py`

  * Fix/customize everything that's broken and specific to your setup
