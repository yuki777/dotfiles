#!/usr/bin/env bash
set -eu

# Depends on...
# ./install-git.bash

# fish
mkdir -p ~/local/src
cd ~/local/src
rm -fr fish fish.tgz fish-shell
wget http://fishshell.com/files/2.3.1/fish-2.3.1.tar.gz -O fish.tgz
tar zxvf fish.tgz
cd fish-2.3.1
./configure --prefix=$HOME/local
make
make install

# http://fisherman.sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# Clone yuki777/git_porcelain
rm -fr ~/src/github.com/yuki777/git_porcelain
mkdir -p ~/src/github.com/yuki777
git clone https://github.com/yuki777/git_porcelain.git ~/src/github.com/yuki777/git_porcelain

# oh my fish
curl -L http://get.oh-my.fish | fish

## Echo help
#echo '----------------------------'
#echo 'Try this commands.'
#echo 'fish -c "fisher ~/src/github.com/yuki777/git_porcelain"'
#echo '----------------------------'
