# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
[ -f ${HOME}/.zshrc.local     ] && source ${HOME}/.zshrc.local
[ -f ${HOME}/.zshrc.alias     ] && source ${HOME}/.zshrc.alias
[ -f ${HOME}/.zshrc.export    ] && source ${HOME}/.zshrc.export
[ -f ${HOME}/.zshrc.function  ] && source ${HOME}/.zshrc.function
[ -f ${HOME}/.zshrc.highlight ] && source ${HOME}/.zshrc.highlight
[ -f ${HOME}/.zshrc.opt       ] && source ${HOME}/.zshrc.opt
[ -f ${HOME}/.zshrc.phpenv    ] && source ${HOME}/.zshrc.phpenv
[ -f ${HOME}/.zshrc.goenv     ] && source ${HOME}/.zshrc.goenv
[ -f ${HOME}/.zshrc.volta     ] && source ${HOME}/.zshrc.volta
[ -f ${HOME}/.zshrc.prompt    ] && source ${HOME}/.zshrc.prompt
#[ -f ${HOME}/.zshrc.starship  ] && source ${HOME}/.zshrc.starship
[ -f ${HOME}/.zshrc.mysql     ] && source ${HOME}/.zshrc.mysql
[ -f ${HOME}/.zshrc.history   ] && source ${HOME}/.zshrc.history

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/adachi/.lmstudio/bin"
# End of LM Studio CLI section



# Added by Windsurf
export PATH="/Users/adachi/.codeium/windsurf/bin:$PATH"


alias claude="/Users/adachi/.claude/local/claude"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

# bun completions
[ -s "/Users/adachi/.bun/_bun" ] && source "/Users/adachi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
