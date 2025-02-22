[ -f ${HOME}/.zshrc.alias  ]    && source ${HOME}/.zshrc.alias
[ -f ${HOME}/.zshrc.export ]    && source ${HOME}/.zshrc.export
[ -f ${HOME}/.zshrc.function ]  && source ${HOME}/.zshrc.function
[ -f ${HOME}/.zshrc.highlight ] && source ${HOME}/.zshrc.highlight
[ -f ${HOME}/.zshrc.opt ]       && source ${HOME}/.zshrc.opt
[ -f ${HOME}/.zshrc.phpenv ]    && source ${HOME}/.zshrc.phpenv
[ -f ${HOME}/.zshrc.goenv ]     && source ${HOME}/.zshrc.goenv
[ -f ${HOME}/.zshrc.volta ]     && source ${HOME}/.zshrc.volta
[ -f ${HOME}/.zshrc.prompt ]    && source ${HOME}/.zshrc.prompt
[ -f ${HOME}/.zshrc.starship ]  && source ${HOME}/.zshrc.starship

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Applications/google-cloud-sdk/completion.zsh.inc'; fi

