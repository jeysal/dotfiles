# grml in user folder (for systems that do not have it installed globally)
ZSH_GRML_CONF=$HOME/.grml.zsh
[[ -f $ZSH_GRML_CONF ]] && source $ZSH_GRML_CONF

# macOS PATH
if [[ ! -z "$IS_MACOS" ]]; then
  export PATH="/usr/local/opt/less/bin:/usr/local/opt/openssl/bin:$HOME/.jenv/shims:$PATH"
  for package in {coreutils,findutils,gnu-sed,gnu-tar,grep}; do
    export PATH="/usr/local/opt/$package/libexec/gnubin:$PATH"
  done
fi

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.jsvu:$CARGO_HOME/bin:$GOPATH/bin:$PATH"


# Vim mode

bindkey -v

# termite vte

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
  export TERM=xterm-256color
fi
# kitty TERM
if [[ $TERM == xterm-kitty ]]; then
  export TERM=xterm-256color
fi

# Prompt

for PROMPTFILE in {/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme,$HOME/.powerlevel10k/powerlevel10k.zsh-theme}; do
  echo $TERM | egrep "(screen|xterm).*" >/dev/null && [[ -f $PROMPTFILE ]] && source ~/.promptcfg && source $PROMPTFILE
done

#PURE_PROMPT_DIR=$HOME/.pure
#if [[ -e $PURE_PROMPT_DIR ]]; then
#  fpath=($PURE_PROMPT_DIR $fpath)
#  autoload -U promptinit; promptinit
#  prompt pure
#fi

# completions
autoload -Uz compinit
fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C;
fi

# Aliases

alias df='df -h'
alias du='du -h'

alias grep='egrep'
alias sed='sed -r'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias gdmb='git diff $(git merge-base origin/master HEAD)'
alias groot='cd $(git rev-parse --show-toplevel)'

alias y='yarn'

alias xclip='xclip -selection clipboard'
alias icat='kitty +kitten icat'

[[ ! -z "$IS_MACOS" ]] || alias open='xdg-open'

alias sudo='sudo '

alias less='less -r'

alias temp='cat /sys/class/thermal/thermal_zone*/temp'

alias update-mirrors='sudo reflector --verbose -l 16 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias audio-youtube-dl='noglob youtube-dl -f "bestaudio[ext=m4a]" --no-playlist'
alias m4a-to-mp3='find . -type f -name "*.m4a" -print0 | nice xargs -0 -i -P8 ffmpeg -n -i {} -b:a 320k {}.mp3'

# Functions
mkcd() { mkdir -p $1 && cd $1 }

watch_macos() {
  PATTERN="$1"
  shift
  while [ $? -ne -2 ]; do
    clear && eval $@;
    watchman-wait . -p $PATTERN;
  done
}

watch_linux() {
  while [ $? -ne -2 ]; do
    clear && eval $@;
    inotifywait -r . @./.git 2>/dev/null;
  done
}

# "Better version" aliases
which exa >& /dev/null && alias ls='exa' && alias l='exa -l' && alias la="exa -la"
which colordiff >& /dev/null && alias diff='colordiff'
which nvim >& /dev/null && alias vi='nvim' && alias vim='nvim'

# aliases from oh-my-zsh

source $HOME/conf/oh-my-zsh/plugins/git/git.plugin.zsh

# History
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# SSH
plugins=(git ssh-agent)

# base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# zsh-nvm
if [[ ! -o login ]] || [[ ! -z "$IS_MACOS" ]]; then
  NVM_LAZY_LOAD=true
  # force load for other commands
  alias nvim="node --version >/dev/null && nvim"
fi
ZSH_NVM=$HOME/conf/zsh-nvm/zsh-nvm.plugin.zsh
[ -s $ZSH_NVM ] && source $ZSH_NVM

# extra
ZSH_EXTRA_CONF=$HOME/.extra.zsh
[[ -f $ZSH_EXTRA_CONF ]] && source $ZSH_EXTRA_CONF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
