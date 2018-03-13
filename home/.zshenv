[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && [[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && exec tmux

export GOPATH="$HOME/proj/go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"

export EDITOR=vi
export VISUAL=nvim
export PAGER=less

export LESSOPEN='|~/.lessfilter %s'

export TERMINFO=~/.terminfo

export DEFAULT_USER=$USER
