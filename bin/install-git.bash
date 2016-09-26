#!/usr/bin/env bash
set -eu

# Install git
mkdir -p ~/local/src
mkdir -p ~/local/bin
cd ~/local/src
rm -fr git
git clone https://github.com/git/git.git
cd git
make configure
./configure --prefix=$HOME/local --with-curl
make
make install

# Install git-extras
mkdir -p ~/local/src
mkdir -p ~/local/bin
cd ~/local/src
git clone https://github.com/tj/git-extras.git
cd git-extras
make install PREFIX=$HOME/local
