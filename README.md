# Install Dev Tools
    # yum|aptitude|source install zsh git vim tmux subversion ctags gtags ack|ag ...
    #  sudo apt-get update -y
    #  sudo apt-get upgrade -y
    #  sudo apt-get install -y zsh vim tmux exuberant-ctags global git subversion mercurial make gcc g++ build-essential devscripts

# Clone Dotfiles
    cd ~
    git clone git@github.com:yuki777/dotfiles.git

# Deploy Dotfiles
    cd ~
    ln -fs dotfiles/.vim       .vim
    ln -fs dotfiles/.vimrc     .vimrc
    ln -fs dotfiles/.vimrc.map .vimrc.map
    ln -fs dotfiles/.zshrc     .zshrc
    ln -fs dotfiles/.zsh       .zsh
    ln -fs dotfiles/.screenrc  .screenrc
    ln -fs dotfiles/.tmux.conf .tmux.conf
    ln -fs dotfiles/.ctags     .ctags
    ln -fs dotfiles/.gtags     .gtags
    ln -fs dotfiles/.tigrc     .tigrc
    ln -fs dotfiles/.gitconfig .gitconfig
    ln -fs dotfiles/.gitignore .gitignore
    cp dotfiles/.vimrc.local  ~/.vimrc.local
    cp dotfiles/.tmux.local   ~/.tmux.local
    cp dotfiles/.zshrc.local  ~/.zshrc.local
    cp dotfiles/.zshrc.mysql  ~/.zshrc.mysql
    touch .gitconfig.local

# Install Latest Vim From Source At Ubuntu (Optional)
    https://gist.github.com/yuki777/9524301

# Setup Vim By NeoBundle
    cd ~
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    vim +NeoBundleInstall +qall

