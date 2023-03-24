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
[ -f ${HOME}/.zshrc.local ]     && source ${HOME}/.zshrc.local
[ -f ${HOME}/.zshrc.opt ]       && source ${HOME}/.zshrc.opt

## debug
#if (which zprof > /dev/null) ;then
#    zprof | less
#fi

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuki/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuki/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuki/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuki/Applications/google-cloud-sdk/completion.zsh.inc'; fi

# phpenv
export PHPENV_ROOT="$HOME/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# bun completions
[ -s "/Users/adachi/.bun/_bun" ] && source "/Users/adachi/.bun/_bun"

## Bun
#export BUN_INSTALL="/Users/adachi/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(~/.rbenv/bin/rbenv init - zsh)"

