[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && [[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && exec tmux

export EDITOR=vi
export VISUAL=nvim
export PAGER=less

export LESSOPEN='|~/.lessfilter %s'

export TERMINFO=~/.terminfo

export DEFAULT_USER=$USER
