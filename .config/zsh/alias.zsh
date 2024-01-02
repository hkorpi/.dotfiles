
# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias ll='ls -lahF --time-style=long-iso'

# +------+
# | grep |
# +------+

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# +-----------+
# | dot files |
# +-----------+

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
