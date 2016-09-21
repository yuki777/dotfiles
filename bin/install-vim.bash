#!/usr/bin/env bash
set -eu

# install
cd $HOME
mkdir -p $HOME/local/src
mkdir -p ~/local/bin
cd $HOME/local/src
rm -fr vim
git clone https://github.com/vim/vim.git
cd vim/src
./configure --without-x --disable-gui --enable-largefile --enable-multibyte --disable-selinux --prefix=$HOME/local
make
make install
