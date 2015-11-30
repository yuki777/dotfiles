#!/usr/bin/env bash
set -eu

mkdir -p ~/local/src
cd ~/local/src
rm -fr git
git clone https://github.com/git/git.git
cd git
make configure
./configure --prefix=$HOME/local --with-curl
make
make install
