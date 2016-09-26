#!/usr/bin/env bash
set -eu

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

# Install "git_porcelain" pulgin with fisherman
fish -c "fisher ~/src/github.com/yuki777/git_porcelain"

# oh-my-fish
curl -L http://get.oh-my.fish | fish; exit

# Install peco
fish -c "omf install peco"
