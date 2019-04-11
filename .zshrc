# Path to your oh-my-zsh installation.
export ZSH=/home/jay/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER=jay

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export MANPATH="/usr/local/man:$MANPATH"

export QT_QPA_PLATFORMTHEME="qt5ct"

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit
# Preferred editor for local and remote sessions
export EDITOR='vim'

export JAVA_HOME=/usr

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
export GPG_TTY=$(tty)

# For a full list of active aliases, run `alias`.
# Aliases
alias n64=mupen64plus
alias ta="tmux attach-session"
alias tmux-resurrect="~/dotfiles/scripts/tmux-resurrect.sh"
alias net-reset="sudo systemctl restart NetworkManager.service"
alias net-test="ping archlinux.org"

alias homestead='function __homestead() { (cd ~/Dev/vboxes/homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias huhs="homestead up;homestead ssh"
alias pat='php artisan tinker'
alias pac='php artisan cache:clear;php artisan view:clear; php artisan route:clear;php artisan config:clear; composer dump-autoload'
alias pu='./vendor/bin/phpunit'
alias dcu='docker-compose up'

# Disable flow control commands (keeps C-s from freezing everything in vim)
stty start undef
stty stop undef
