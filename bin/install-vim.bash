#!/usr/bin/env bash
#set -eu

# Set lua option
enable_luainterp="--enable-luainterp=no"
with_lua_prefix=
lua_path=`which lua`
if [ "$?" == "0" ];then
    if [ "$lua_path" == "/usr/local/bin/lua" ]; then
        lua_prefix=/usr/local
    elif [ "$lua_path" == "/usr/bin/lua" ]; then
        lua_prefix=/usr
    elif [ "$lua_path" == "$HOME/local/bin/lua" ]; then
        lua_prefix=$HOME/local
    else
        lua_prefix=/usr
    fi
    enable_luainterp="--enable-luainterp=yes"
    with_lua_prefix="--with-lua-prefix=$lua_prefix"
fi

# install
cd $HOME
mkdir -p $HOME/local/src
mkdir -p ~/local/bin
cd $HOME/local/src
rm -fr vim
git clone https://github.com/vim/vim.git
cd vim/src
./configure \
 --without-x --disable-gui --enable-largefile --enable-multibyte --disable-selinux \
 $enable_luainterp $with_lua_prefix --prefix=$HOME/local
make
make install
