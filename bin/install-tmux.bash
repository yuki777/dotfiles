#!/usr/bin/env bash
set -eu

mkdir -p ~/local/src
mkdir -p ~/local/bin
cd ~/local/src
rm -fr tmux-2.0
wget 'https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz'
tar zxvf tmux-2.0.tar.gz
cd tmux-2.0
./configure --prefix=$HOME/local
make
make install
