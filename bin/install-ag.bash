#!/usr/bin/env bash
set -eu

# install
cd $HOME
mkdir -p $HOME/local/src
mkdir -p $HOME/local/bin
cd $HOME/local/src
rm -fr the_silver_searcher*
wget 'http://geoff.greer.fm/ag/releases/the_silver_searcher-0.31.0.tar.gz'
tar zxvf the_silver_searcher-0.31.0.tar.gz
cd the_silver_searcher-0.31.0
./configure --prefix=$HOME/local
make
make install
