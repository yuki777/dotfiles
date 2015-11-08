# LANG=C
case ${UID} in
0)
    LANG=C
    ;;
esac

# autoload
autoload history-search-end
autoload -U compinit
autoload zed
autoload colors
autoload -Uz zmv
compinit -C

## bindkey
bindkey -e
#bindkey "^[[1~" beginning-of-line # Home gets to line head
#bindkey "^[[4~" end-of-line # End gets to line end
#bindkey "^[[3~" delete-char # Del
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
#bindkey "\\ep" history-beginning-search-backward-end
#bindkey "\\en" history-beginning-search-forward-end
#bindkey "\e[Z" reverse-menu-complete

# zle
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# others
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
#fpath=(${HOME}/.zsh/functions/Completion ${fpath})

# setopt
setopt prompt_subst
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt complete_aliases     # aliased ls needs if file/dir completions work
setopt APPEND_HISTORY         # .zsh-history を上書きではなく追加
setopt AUTO_CD                # ディレクトリ名だけを入力した時にそこに cd する
setopt AUTO_LIST              # 候補が複数ある時に自動的に一覧を出す
setopt AUTO_MENU              # TAB で順に補完候補を切り替える
##setopt AUTO_PARAM_SLASH       # 変数名補完時に、その値がディレクトリ名なら直後にスラッシュも補う
setopt AUTO_PARAM_KEYS        # カッコの対応などを自動的に補完
#setopt AUTO_RESUME            # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
#setopt CHECK_JOBS             # シェルを抜ける (exit) 時に、zsh: you have runnning jobs と警告を出す
setopt CORRECT                # コマンドのスペルチェック
#setopt CORRECT_ALL            # 対象のファイルもスペルチェックをする
setopt EXTENDED_GLOB          # 拡張補完。ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt EXTENDED_HISTORY       # zsh の開始, 終了時刻をヒストリファイルに書き込む
#setopt GLOB_DOTS              # . で開始するファイル名にマッチさせるとき、先頭に明示的に . を指定する必要がなくなる。
#setopt HASH_CMDS              # 各コマンドが実行されるときにパスをハッシュに入れる
#setopt HIST_EXPIRE_DUPS_FIRST # ヒストリリストに追加されるコマンド行が古いものと同じなら古いものを削除する
##setopt HIST_NO_STORE          # history コマンドを history に保存しない
##setopt HIST_IGNORE_DUPS       # 直前と同じコマンドをヒストリに追加しない
setopt HIST_REDUCE_BLANKS     # 余分な空白は詰めて記録
#setopt HIST_SAVE_NO_DUPS      # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
#setopt INC_APPEND_HISTORY     # 履歴をインクリメンタルに追加
setopt LIST_TYPES             # 補完候補一覧でファイルの種別をマーク表示
setopt MARK_DIRS              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt NUMERIC_GLOB_SORT      # 数字を数値と解釈してソートする
setopt NOBEEP                 # ビープを鳴らさない
#setopt NO_FLOW_CONTROL        # disable C-q, C-s
#setopt PROMPT_SUBST           # PROMPT 変数に対して変数展開、コマンド置換、算術展開を施す
#setopt RM_STAR_WAIT           # rm * を実行する前に確認
setopt SHARE_HISTORY          # 履歴の共有
#setopt EQUALS                 # =command を command のパス名に展開する
#setopt HIST_VERIFY            # ヒストリを呼び出してから実行する間に一旦編集
#setopt LIST_ROWS_FIRST        # 補完リストを水平にソートする
#setopt LONG_LIST_JOBS         # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt PRINT_EIGHT_BIT        # 出力時8ビットを通す
setopt interactive_comments # '#' 以降をコメントとして扱う
unsetopt PROMPTCR            # 出力の文字列末尾に改行コードが無い場合でも表示
setopt PUSHD_IGNORE_DUPS      # 同じディレクトリを pushd しない
setopt AUTO_PUSHD              # cd 時に自動で push. cd -[TAB]
setopt MAGIC_EQUAL_SUBST      # --prefix=/usr などの = 以降も補完
setopt RM_STAR_SILENT         # http://zsh.sourceforge.net/Doc/Release/Options.html#index-NORMSTARSILENT

REPORTTIME=3 # 実行したプロセスの消費時間が3秒以上かかったらtimeコマンド表示
TIMEFMT="%J # %E" # REPORTTIMEのフォーマットを変更

zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history

# HighLight
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo*' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('\|' 'fg=magenta,bold')
ZSH_HIGHLIGHT_PATTERNS+=('>' 'fg=magenta,bold')
ZSH_HIGHLIGHT_PATTERNS+=('>>' 'fg=magenta,bold')
ZSH_HIGHLIGHT_PATTERNS+=('git push*' 'fg=white,bold,bg=red')

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# source
[ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local
[ -f ${HOME}/.zshrc.mysql ] && source ${HOME}/.zshrc.mysql
[ -f ${HOME}/.zshrc.git   ] && source ${HOME}/.zshrc.git
[ -f ${HOME}/.zshrc.cl    ] && source ${HOME}/.zshrc.cl
[ -f ${HOME}/.zshrc.prompt ] && source ${HOME}/.zshrc.prompt
[ -f ${HOME}/.zshrc.alias  ] && source ${HOME}/.zshrc.alias
[ -f ${HOME}/.zshrc.export ] && source ${HOME}/.zshrc.export
[ -f ${HOME}/.zshrc.function ] && source ${HOME}/.zshrc.function

# The next line updates PATH for the Google Cloud SDK.
[ -f ~/google-cloud-sdk/path.zsh.inc ] && source ~/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
[ -f /home/vagrant/google-cloud-sdk/completion.zsh.inc ] && source /home/vagrant/google-cloud-sdk/completion.zsh.inc

## debug
#if (which zprof > /dev/null) ;then
#    zprof | less
#fi
