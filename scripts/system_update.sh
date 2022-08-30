#!/bin/zsh
echo 'Running Arch updates'
pacaur -Syyu
echo 'Running oh-my-zsh updates'
sh $ZSH/tools/upgrade.sh
echo 'Running tmux plugin updates'
sh ~/.tmux/plugins/tpm/bin/update_plugins all
echo 'Running vim plugin updates'
rm ~/.vim/bundle/changelog.md
vim -i NONE -c VundleUpdate -c VundleChangelog -c 'w ~/.vim/bundle/changelog.md' -c quitall
cat ~/.vim/bundle/changelog.md
echo 'Running coc-vim updates'
cd ~/.vim/bundle/coc.nvim && git pull origin release && cd ~/
vim -c 'CocUpdateSync|q'
