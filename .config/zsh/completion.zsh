
#fpath=($ZDOTDIR $fpath)

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# +---------+
# | Options |
# +---------+

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
#setopt COMPLETE_ALIASES    # Prevents aliases on the command line from being internally substituted before completion is attempted.

# +---------+
# | zstyles |
# +---------+

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

# Use dir colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Allow you to select in a menu
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete  # shift+tab
