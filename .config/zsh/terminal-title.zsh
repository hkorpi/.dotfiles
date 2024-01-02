# Set terminal title
#
# References:
# https://github.com/mbenford/zsh-tmux-auto-title/tree/master
# https://github.com/sorin-ionescu/prezto/blob/master/modules/terminal/init.zsh
# https://github.com/olets/zsh-window-title
# https://github.com/trystan2k/zsh-tab-title/
#
terminal::title() {
  print -Pn "\e]2;$1\e\\"
}

function terminal::precmd {
  emulate -L zsh

  terminal::title "%30<..<%~%<<"
}

function terminal::preexec {
  emulate -L zsh
  
  local CMD=${1:gs/%/%%}
  terminal::title "%20<..<%~%<< - $CMD"
}

autoload -U add-zsh-hook
add-zsh-hook precmd terminal::precmd
add-zsh-hook preexec terminal::preexec

