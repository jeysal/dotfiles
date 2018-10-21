# auto exec tmux
#[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && \
#[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && \
#[[ -z "$ANDROID_ROOT" ]] && [[ -z "$SSH_CONNECTION" ]] && \
#exec tmux

export GOPATH="$HOME/proj/go"
export CARGO_HOME="$HOME/.cargo"

# macOS
if uname -a | grep >/dev/null Darwin; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
  for package in {coreutils,findutils,gnu-sed,gnu-tar,grep}; do
    export PATH="/usr/local/opt/$package/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/$package/libexec/gnuman:$PATH"
  done
fi

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.jsvu:$CARGO_HOME/bin:$GOPATH/bin:$PATH"

export EDITOR=vi
export VISUAL=nvim
export PAGER=less

export LESSOPEN='|~/.lessfilter %s'

export TERMINFO=~/.terminfo

export DEFAULT_USER=$USER
