[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && \
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && \
[[ -z "$ANDROID_ROOT" ]] && [[ -z "$SSH_CONNECTION" ]] && \
exec tmux
export EDITOR=vi
export VISUAL=nvim
export PAGER=less

export SUDO_ASKPASS=/usr/bin/qt4-ssh-askpass
[[ -f "$XDG_RUNTIME_DIR/gcr/ssh" ]] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

export GOPATH="$HOME/proj/go"
export CARGO_HOME="$HOME/.cargo"
export XDG_CONFIG_HOME="$HOME/.config"

export FZF_DEFAULT_COMMAND="rg --fixed-strings --ignore-case --no-heading --hidden --no-ignore --glob '!.git/*'"
export LESSOPEN='|~/.lessfilter %s'

export DEFAULT_USER=$USER

export HUSKY=0

# grml-zsh-config for some reason completes globs with a menu instead of inserting all matches, unless this is set
export NOCOR=1

if uname | grep >/dev/null Darwin; then
  export IS_MACOS=true
fi
if uname -a | grep >/dev/null rpi-legacy; then
  export IS_RASPI=true
fi
