#!/usr/bin/env bash
set -eu

# Install
#  cd
#  git clone https://github.com/yuki777/dotfiles.git

cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map
ln -sf dotfiles/.zshenv
ln -sf dotfiles/.zshrc
ln -sf dotfiles/.zshrc.alias
ln -sf dotfiles/.zshrc.export
ln -sf dotfiles/.zshrc.function
ln -sf dotfiles/.zshrc.highlight
ln -sf dotfiles/.zshrc.mysql
ln -sf dotfiles/.zshrc.opt
ln -sf dotfiles/.zshrc.prompt
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs dotfiles/.psqlrc
ln -fs dotfiles/.my.cnf
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide
ln -fs ~/dotfiles/.config/fish           ~/.config/fish

for file in .vimrc.local .tmux.local .zshrc.local .ctagsignore ; do
	if [ -e "~/$file" ]; then
		#echo "~/$file found."
		:
	else
		#echo "~/$file NOT found."
		cp dotfiles/$file ~
	fi
done

touch .gitconfig.local

~/dotfiles/bin/setup-vim.bash
~/dotfiles/bin/setup_tmux_local
