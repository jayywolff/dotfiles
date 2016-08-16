#Jay's dotfiles
  

My dotfiles for a sweet tiling wm Arch Linux setup. Install this as a base and throw your tools/packages on top.  
The main attractions:  
* vim <3
* i3-gaps
* i3-blocks
* zsh
* gtk
* termite
* ranger
* lightdm
* git

Some configurations/keybindings are specific to Arch Linux and the keyboard of my thinkpad  
This is a work in progress.  

##Current setup screenshot
![Screenshot] (http://i.imgur.com/WBf6UES.png)

##To recreate a minimal install with my current setup
  * Install Arch Linux or the headless install of Debian, Ubuntu, Fedora, OpenSuse, or even FreeBSD
  
  * Install x11, i3-gaps, i3status, i3bar, i3blocks, i3-lock-wrapper, lightdm, lightdm-gtk-greeter, termite, rofi, gvim, compton-git, ranger, irssi, feh, zsh, zsh-completions, git, xdotool, nm-applet

  * Clone or copy dotfiles to ~/

  * Install fonts (FontAwesome, Powerline patched fonts, infinality-bundle(Arch only))

  * adjust variables to your local setup in scripts/updateDotfiles.sh

  * `chmod +x ~/dotfiles/scripts/updateDotfiles.sh && bash ~/dotfiles/scripts/updateDotfiles.sh`

  * Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

  * Fix/customize everything that's broken and specific to your setup
  
  * Setup your 
