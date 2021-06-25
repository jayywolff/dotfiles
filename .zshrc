# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

# setup npm
export PATH="$PATH:$HOME/.node_modules/bin"
export npm_config_prefix=~/.node_modules

# setup cargo
export PATH="$PATH:$HOME/.cargo/bin"

export QT_QPA_PLATFORMTHEME="gtk2"

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

export EDITOR='vim'
export VISUAL=$EDITOR

export JAVA_HOME=/usr

# Compilation flags
#export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
export GPG_TTY=$(tty)

# rbenv
eval "$(rbenv init -)"

# For a full list of active aliases, run `alias`.
# Aliases
alias logs="journalctl -xfb"
alias mpa="mpv --no-video"
alias n64=mupen64plus
alias ta="tmux attach-session"
alias tmux-resurrect="~/dotfiles/scripts/tmux-resurrect.sh"
alias net-reset="sudo systemctl restart NetworkManager.service"
alias net-test="ping archlinux.org"
alias system-update="~/dotfiles/scripts/system_update.sh"
alias tres="~/dotfiles/scripts/tmux-resurrect.sh"
alias sup="~/dotfiles/scripts/system_update.sh"
alias poff="poweroff"

alias homestead='function __homestead() { (cd ~/Dev/homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias huhs="homestead up;homestead ssh"
alias hrhs="homestead reload;homestead ssh"
alias pat='php artisan tinker'
alias pam='php artisan migrate'
alias pamr='php artisan migrate:rollback --step=1'
alias pamf='php artisan migrate:fresh --seed'
alias pac='php artisan cache:clear;php artisan view:clear; php artisan route:clear;php artisan config:clear; composer dump-autoload'
alias pu='./vendor/bin/phpunit --configuration ./phpunit_local.xml'
alias nrd='npm run development'
alias nrp='npm run production'
alias nrw='npm run watch'
alias laralog='tail -f ./storage/logs/laravel.log'
alias ras='rails server'
alias rac='rails console'
alias rag='rails generate'
alias ral='tail -f log/development.log'
alias ragm='rails generate migration'
alias ram='rails db:migrate'
alias ramr='rails db:rollback'
alias ramrm='rails db:rollback && rails db:migrate'
alias rams='rails db:migrate:status'
alias dcu='docker-compose up'
alias gitlog="git log --author $USER --branches *"
alias gcom="git checkout master"
alias gcob="git checkout -b"
alias grem="git checkout master && git pull origin master && git checkout - && git rebase --interactive --committer-date-is-author-date master"
alias gred="git checkout development && git pull origin development && git checkout - && git rebase --interactive --committer-date-is-author-date development"
alias deploy="git checkout master && git pull origin master && git checkout - && git rebase --committer-date-is-author-date master && git push --force-with-lease && git checkout master && git merge - && git push"
alias grc="git rebase --continue"
alias gpo="git push -u origin"
alias gpf="git push --force-with-lease --force-if-includes"
alias gdp="git diff --patience"
alias gcos="git checkout db/schema.rb"
alias gamend='git commit --amend --all --no-edit'
alias git-https='git remote set-url origin https://github.com/$(git remote get-url origin | sed "s/https:\/\/github.com\///" | sed "s/git@github.com://")'
alias git-ssh='  git remote set-url origin git@github.com:$(    git remote get-url origin | sed "s/https:\/\/github.com\///" | sed "s/git@github.com://")'
alias hrc="heroku run rails c -a"
# Disable flow control commands (keeps C-s from freezing everything in vim)
stty start undef
stty stop undef

