#!/usr/bin/env bash
set -eux

mkdir -p ~/local/src ~/local/bin
cd ~/local/src

if [ -f ~/local/bin/peco ];then
    echo "~/local/bin/peco is exists."
	exit 0
fi

case "${OSTYPE}" in
    freebsd*)
        echo "Sorry, I can't support FreeBSD."
        exit 0
        ;;
    darwin*)
        rm -fr peco_*
        wget 'https://github.com/peco/peco/releases/download/v0.5.3/peco_darwin_amd64.zip'
        unzip peco_darwin_amd64.zip
        cp peco_darwin_amd64/peco ~/local/bin/peco
        chmod 744 ~/local/bin/peco
        ;;
    linux*)
        rm -fr peco_*
        wget 'https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz'
        tar zxvf peco_linux_amd64.tar.gz
        cp peco_linux_amd64/peco ~/local/bin/peco
        chmod 744 ~/local/bin/peco
        ;;
esac
