#Jay's dotfiles
  
My dotfiles for: 
i3-gaps
i3-blocks
zsh
vim
ranger
urxvt
lightdm

Some configurations/keybindings are specific to Arch Linux and the keyboard of my thinkpad  
I need to clean out a lot of junk. This is a work in progress. Currently in beta.
Still need to add configs for irssi, mpd & ncmpcpp, & urxvt. Installation Script coming soon.  

##Current setup screenshot
![Screenshot] (http://i.imgur.com/WBf6UES.png)

##To recreate a minimal install with my current setup
  * Install Arch Linux or the minimal install of Debian, Ubuntu, Fedora, OpenSuse, and even FreeBSD
  
  * Install xorg-server, i3-gaps-git, lightdm,lightdm-gtk-greeter, gnome-terminal, rofi-git, i3status, i3-lock-wrapper, i3bar, i3blocks, gvim, compton-git, ranger, irssi, zsh, zsh-completions, git, xdotool

  * Copy over dotfiles to ~/

  * Install fonts (FontAwesome, Powerline patched fonts, infinality-bundle(Arch))

  * Change default shell to zsh, install oh-my-zsh

  * chmod +x ~/dotfiles/scripts/updateDotfiles.sh && bash ~/dotfiles/scripts/updateDotfiles.sh

  * Setup vim by installing Vundle and then :PluginInstall, and manually compile YouCompleteMe

  * Fix/customize everything that's broken
