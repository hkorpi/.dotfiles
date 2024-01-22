
# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias ll='ls -lahF --time-style=long-iso'

# +-----------------------------------------+
# | interactive commands - ask confirmation |
# +-----------------------------------------+

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

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

# +----+
# | ps |
# +----+

# similar long BSD options: ps auxf
alias pl='ps -elyFH | less -S'

