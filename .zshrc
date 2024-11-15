## Amazon Q pre block. Keep at the top of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# autoload
autoload -U history-search-end
autoload -U zed
autoload -U colors
autoload -Uz zmv
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

# bindkey
bindkey -e
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# zle
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end


# zstyle
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# others
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
REPORTTIME=3 # 実行したプロセスの消費時間が3秒以上かかったらtimeコマンド表示
TIMEFMT="%J # %E" # REPORTTIMEのフォーマットを変更

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# .env
if [ -f $HOME/.env ]; then
    export $(grep -v '^#' $HOME/.env | xargs)
fi

# source
[ -f ${HOME}/.zshrc.prompt ]    && source ${HOME}/.zshrc.prompt
[ -f ${HOME}/.zshrc.alias  ]    && source ${HOME}/.zshrc.alias
[ -f ${HOME}/.zshrc.export ]    && source ${HOME}/.zshrc.export
[ -f ${HOME}/.zshrc.function ]  && source ${HOME}/.zshrc.function
[ -f ${HOME}/.zshrc.highlight ] && source ${HOME}/.zshrc.highlight
[ -f ${HOME}/.zshrc.mysql ]     && source ${HOME}/.zshrc.mysql
[ -f ${HOME}/.zshrc.local ]     && source ${HOME}/.zshrc.local
[ -f ${HOME}/.zshrc.opt ]       && source ${HOME}/.zshrc.opt


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# bun completions
[ -s "/Users/adachi/.bun/_bun" ] && source "/Users/adachi/.bun/_bun"

## Bun
#export BUN_INSTALL="/Users/adachi/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
[ -e "$HOME/.rbenv/bin/rbenv" ] && eval "$(~/.rbenv/bin/rbenv init - zsh)"

#if type starship > /dev/null; then
#	config_files=(
#	  ~/.config/starship/base.toml
#	  ~/.config/starship/custom.toml
#	)
#	cat "${config_files[@]}" > ~/.config/starship.toml
#    eval "$(starship init zsh)"
#fi
eval "$(starship init zsh)"


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Amazon Q post block. Keep at the bottom of this file.
#[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# debug
if (which zprof > /dev/null) ;then
    zprof
fi

## phpenv
#export PHPENV_ROOT="$HOME/.phpenv"
#if [ -d "${PHPENV_ROOT}" ]; then
#  export PATH="${PHPENV_ROOT}/bin:${PATH}"
#  eval "$(phpenv init -)"
#fi

# go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/adachi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/adachi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/adachi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/adachi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
