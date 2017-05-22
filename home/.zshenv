[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && [[ -z "$TMUX" ]] && exec tmux

export EDITOR=vi
export VISUAL=vim
export PAGER=less

export LESSOPEN='|~/.lessfilter %s'

export TERMINFO=~/.terminfo

export DEFAULT_USER=$USER
