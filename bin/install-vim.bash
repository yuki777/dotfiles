#!/usr/bin/env bash
set -eu

# install
cd $HOME
mkdir -p $HOME/local/src
cd $HOME/local/src
rm -fr vim
hg clone https://bitbucket.org/vim-mirror/vim
cd vim/src
./configure --prefix=$HOME/local --with-lua-prefix=/usr --enable-luainterp=yes --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-multibyte --enable-gui=no --with-features=huge --without-x
make
make install
