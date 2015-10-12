# Install Dev Tools
    # yum|aptitude|source install zsh git vim tmux subversion ctags gtags ack|ag ...
    #  sudo apt-get update -y
    #  sudo apt-get upgrade -y
    #  sudo apt-get install -y zsh vim tmux exuberant-ctags global git subversion mercurial make gcc g++ build-essential devscripts

# Clone Dotfiles
    cd ~
    git clone git@github.com:yuki777/dotfiles.git

# Deploy Dotfiles
```
cd ~
mkdir -p ~/.vim/data
mkdir -p ~/bin
ln -fs dotfiles/.vimrc
ln -fs dotfiles/.vimrc.map
ln -fs dotfiles/.zshrc
ln -fs dotfiles/.zshrc.prompt
ln -fs dotfiles/.zshrc.alias
ln -fs dotfiles/.zsh
ln -fs dotfiles/.zshenv
ln -fs dotfiles/.tmux.conf
ln -fs dotfiles/.ctags
ln -fs dotfiles/.gtags
ln -fs dotfiles/.tigrc
ln -fs dotfiles/.gitconfig
ln -fs dotfiles/.gitignore
ln -fs dotfiles/.git_template
ln -fs ~/dotfiles/bin/git_merge_wrapper3 ~/bin/git_merge_wrapper3
ln -fs ~/dotfiles/bin/tmuxx              ~/bin/tmuxx
ln -fs ~/dotfiles/bin/tmuxxx             ~/bin/tmuxxx
ln -fs ~/dotfiles/bin/clide              ~/bin/clide
cp dotfiles/.vimrc.local  ~
cp dotfiles/.tmux.local   ~
cp dotfiles/.zshrc.local  ~
cp dotfiles/.zshrc.mysql  ~
cp dotfiles/.ctagsignore  ~
touch .gitconfig.local
```

# Setup tmux config
```
~/dotfiles/bin/setup_tmux_local
```

# Setup Vim By NeoBundle
```
cd $HOME
mkdir -p $HOME/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
git clone git://github.com/Shougo/unite.vim     $HOME/.vim/bundle/unite.vim
git clone git://github.com/Shougo/vimproc.vim   $HOME/.vim/bundle/vimproc
cd $HOME/.vim/bundle/vimproc && make -f make_unix.mak
$HOME/.vim/bundle/neobundle.vim/bin/neoinstall
```

# yankring,yanktmp
```
mkdir -p ~/.vim/data/yankring
mkdir -p ~/.vim/data/yanktmp
```

# neosnippets
```
cp $HOME/dotfiles/.vim/data/neosnippet/* $HOME/.vim/data/neosnippet/
```
Mon Oct 12 11:14:27 ICT 2015
