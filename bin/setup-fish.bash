#!/usr/bin/env bash
set -eu

# http://fisherman.sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# Clone yuki777/git_porcelain
rm -fr ~/src/github.com/yuki777/git_porcelain
mkdir -p ~/src/github.com/yuki777
git clone https://github.com/yuki777/git_porcelain.git ~/src/github.com/yuki777/git_porcelain

# oh my fish
curl -L http://get.oh-my.fish | fish

# Echo help
echo '----------------------------'
echo 'Try this commands.'
echo 'fish -c "fisher ~/src/github.com/yuki777/git_porcelain"'
echo '----------------------------'
