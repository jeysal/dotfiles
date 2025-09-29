if uname | grep >/dev/null Darwin; then
  export IS_MACOS=true
  source ~/.macos.zshenv
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if uname -a | grep >/dev/null rpi-legacy; then
  export IS_RASPI=true
fi

[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && \
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && \
[[ -z "$ANDROID_ROOT" ]] && [[ -z "$SSH_CONNECTION" ]] && {
  if [ ! -z "$XDG_RUNTIME_DIR" ]; then
    socket_name=${WAYLAND_DISPLAY:-default}
    socket_path="$XDG_RUNTIME_DIR/tmux-$socket_name"
    exec tmux -S "$socket_path"
  else
    exec tmux
  fi
}

# Fuck do I know why this dies without `2| tee`
export FZF_DEFAULT_COMMAND="rg -l --fixed-strings --ignore-case --hidden --no-ignore --glob '!.git/*' --glob '!.stversions/*' 2| tee /dev/null "
export LESSOPEN='|~/.lessfilter %s'

export HUSKY=0

# grml-zsh-config for some reason completes globs with a menu instead of inserting all matches, unless this is set
export NOCOR=1
