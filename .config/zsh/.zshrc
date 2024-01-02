
# see https://zsh.sourceforge.io/Doc/Release/Options.html

# +------------+
# | NAVIGATION |
# +------------+

export DIRSTACKSIZE=10

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
#setopt PUSHD_IGNORE_DUPS   # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CD_SILENT            # Never print the working directory after a cd

setopt CORRECT              # Spelling correction
#setopt CDABLE_VARS         # Change directory to a path stored in a variable.
#setopt EXTENDED_GLOB       # Use extended globbing syntax.

function nav-redraw-prompt() { BUFFER=; zle accept-line; }
function nav-parent() { cd -q .. && nav-redraw-prompt }
function nav-cd-rotate() {
  () {
    while (( $#dirstack )) && ! pushd -q $1 &>/dev/null; do
      popd -q $1
    done
    (( $#dirstack ))
  } "$@" && nav-redraw-prompt
}
function nav-back()    { nav-cd-rotate +1; }
function nav-forward() { nav-cd-rotate -0; }

zle -N nav-parent
zle -N nav-back
zle -N nav-forward

bindkey '^[[1;3A' nav-parent
bindkey '[1;3D' nav-back
bindkey '^[[1;3C' nav-forward

# references:
# https://github.com/romkatv/zsh4humans/blob/v5/fn/-z4h-cd-rotate

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Up arrow
bindkey "${terminfo[kcuu1]}" history-search-backward
# Down arrow
bindkey "${terminfo[kcud1]}" history-search-forward

# +--------+
# | COLORS |
# +--------+

# Override colors
eval "$(dircolors -b $ZDOTDIR/dir_colors)"

# +---------+
# | SOURCES |
# +---------+

source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/completion.zsh"

source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

source /usr/share/doc/fzf/examples/key-bindings.zsh
bindkey '[1;3B' fzf-cd-widget
source /usr/share/doc/fzf/examples/completion.zsh

source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/terminal-title.zsh"
