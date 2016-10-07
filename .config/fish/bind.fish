function fish_user_key_bindings
  # http://qiita.com/susieyy/items/ac2133e249f252dc9a34
  bind \cr 'peco_select_history (commandline -b)' # Bind for peco history to Ctrl+r

  # https://github.com/yoshiori/fish-peco_select_zsh_history
  bind \ct 'peco_select_zsh_history (commandline -b)'
end
