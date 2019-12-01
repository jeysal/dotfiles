[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && \
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && \
[[ -z "$ANDROID_ROOT" ]] && [[ -z "$SSH_CONNECTION" ]] && \
exec tmux

export GOPATH="$HOME/proj/go"
export CARGO_HOME="$HOME/.cargo"

export EDITOR=vi
export VISUAL=nvim
export PAGER=less

export LESSOPEN='|~/.lessfilter %s'

export TERMINFO=~/.terminfo

export DEFAULT_USER=$USER

if uname | grep >/dev/null Darwin; then
  export IS_MACOS=true
fi

[ -z "$LANG" ] && export LANG=en_US.UTF-8
[ -z "$LC_ALL" ] && export LC_ALL=en_US.UTF-8
