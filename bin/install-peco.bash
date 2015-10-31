#!/usr/bin/env bash
set -eu

mkdir -p ~/local/src
cd ~/local/src
rm -fr peco_linux_amd64
wget 'https://github.com/peco/peco/releases/download/v0.3.3/peco_linux_amd64.tar.gz'
tar zxvf peco_linux_amd64.tar.gz
cp peco_linux_amd64/peco ~/local/bin/peco
chmod 744 ~/local/bin/peco
