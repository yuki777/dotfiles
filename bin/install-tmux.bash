#!/usr/bin/env bash
set -eu

#version=2.3
version=3.2

mkdir -p ~/local/src
mkdir -p ~/local/bin
cd ~/local/src
rm -fr tmux-$version
wget "https://github.com/tmux/tmux/releases/download/$version/tmux-$version.tar.gz"
tar zxvf tmux-$version.tar.gz
cd tmux-$version
./configure --prefix=$HOME/local
make && make install
