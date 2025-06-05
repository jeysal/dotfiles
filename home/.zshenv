[[ $- == *i* ]] && echo $TERM | grep "xterm.*" >/dev/null && \
[[ -z "$TMUX" ]] && [[ -z "$NOTMUX" ]] && \
[[ -z "$ANDROID_ROOT" ]] && [[ -z "$SSH_CONNECTION" ]] && \
exec tmux

# Fuck do I know why this dies without `2| tee`
export FZF_DEFAULT_COMMAND="rg -l --fixed-strings --ignore-case --hidden --no-ignore --glob '!.git/*' --glob '!.stversions/*' 2| tee /dev/null "
export FZF_CTRL_T_COMMAND="rg -l --fixed-strings --ignore-case --hidden --no-ignore --glob '!.git/*' --glob '!.stversions/*' 2| tee /dev/null "
export LESSOPEN='|~/.lessfilter %s'

export HUSKY=0

# grml-zsh-config for some reason completes globs with a menu instead of inserting all matches, unless this is set
export NOCOR=1

if uname | grep >/dev/null Darwin; then
  export IS_MACOS=true
  export PATH="/usr/local/opt/less/bin:/usr/local/opt/openssl/bin:$HOME/.jenv/shims:$PATH"
  for package in {coreutils,findutils,gnu-sed,gnu-tar,grep}; do
    export PATH="/usr/local/opt/$package/libexec/gnubin:$PATH"
  done
fi
if uname -a | grep >/dev/null rpi-legacy; then
  export IS_RASPI=true
fi
