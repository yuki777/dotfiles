#!/usr/bin/env bash
set -eu

if [ ! -d ~/dotfiles ]; then
    git clone http://github.com/yuki777/dotfiles.git ~/dotfiles
fi

cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin

# vim
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map

# zsh
ln -sf dotfiles/.zshenv
ln -sf dotfiles/.zshrc
ln -sf dotfiles/.zshrc.alias
ln -sf dotfiles/.zshrc.export
ln -sf dotfiles/.zshrc.function
ln -sf dotfiles/.zshrc.highlight
ln -sf dotfiles/.zshrc.mysql
ln -sf dotfiles/.zshrc.opt
ln -sf dotfiles/.zshrc.prompt

# others
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs dotfiles/.psqlrc
ln -fs dotfiles/.my.cnf

# bin
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide

# .config
mkdir -p ~/.config
for file in fish omf nvim ; do
	if [ ! -h ~/$file ]; then
        ln -fs ~/dotfiles/.config/$file ~/.config/$file
    fi
	if [ -L ~/.config/$file/$file ]; then
        unlink ~/.config/$file/$file
    fi
done

# local files
for file in .vimrc.local .tmux.local .zshrc.local .ctagsignore ; do
	if [ ! -e ~/$file ]; then
		cp dotfiles/$file ~
	fi
done
touch .gitconfig.local

# tmux
~/dotfiles/bin/setup_tmux_local

# zsh
~/dotfiles/bin/install-zsh-vcs-prompt.bash
~/dotfiles/bin/install-zsh-syntax-highlighting.bash

# vim
~/dotfiles/bin/setup-vim.bash
