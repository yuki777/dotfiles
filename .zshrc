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

# setopt
[ -f ${HOME}/.zshrc.opt ] && source ${HOME}/.zshrc.opt

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

# source
[ -f ${HOME}/.zshrc.mysql ]     && source ${HOME}/.zshrc.mysql
[ -f ${HOME}/.zshrc.git   ]     && source ${HOME}/.zshrc.git
[ -f ${HOME}/.zshrc.cl    ]     && source ${HOME}/.zshrc.cl
[ -f ${HOME}/.zshrc.prompt ]    && source ${HOME}/.zshrc.prompt
[ -f ${HOME}/.zshrc.alias  ]    && source ${HOME}/.zshrc.alias
[ -f ${HOME}/.zshrc.export ]    && source ${HOME}/.zshrc.export
[ -f ${HOME}/.zshrc.function ]  && source ${HOME}/.zshrc.function
[ -f ${HOME}/.zshrc.highlight ] && source ${HOME}/.zshrc.highlight
[ -f ${HOME}/.zshrc.local ]     && source ${HOME}/.zshrc.local

# The next line updates PATH for the Google Cloud SDK.
[ -f ~/google-cloud-sdk/path.zsh.inc ] && source ~/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
[ -f /home/vagrant/google-cloud-sdk/completion.zsh.inc ] && source /home/vagrant/google-cloud-sdk/completion.zsh.inc

## debug
#if (which zprof > /dev/null) ;then
#    zprof | less
#fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
