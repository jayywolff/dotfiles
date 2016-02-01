#Jay's dotfiles
  
My dotfiles for: 
i3-gaps
i3-blocks
zsh
ranger
vim
lightdm

urxvt
Some configurations/keybindings are specific to Arch Linux and the keyboard of my thinkpad  
I need to clean out a lot of junk. This is a work in progress. Currently in beta.
Still need to add configs for irssi, mpd & ncmpcpp, & urxvt. Installation Script coming soon.  

##Current setup screenshot
![Screenshot] (http://i.imgur.com/bHHHpaG.png)

##To recreate a minimal install with my current setup
  * Install Arch Linux or Net install of debian/ubuntu
  
  * Install xorg-server, i3-gaps-git, lightdm,lightdm-gtk-greeter, gnome-terminal, rofi-git, i3status, i3-lock-wrapper, i3bar, i3blocks, gvim, compton-git, ranger, irssi, zsh, zsh-completions, git, xdotool

  * Copy over dotfiles to ~/

  * Install fonts (FontAwesome, Powerline patched fonts, infinality-bundle(Arch))

  * Change default shell to zsh, install oh-my-zsh

  * chmod +x ~/dotfiles/dotfiles_setup.sh && bash ~/dotfiles/dotfiles_setup.sh

  * Fix/customize everything that's broken
