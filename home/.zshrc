# grml in user folder (for systems that do not have it installed globally)
ZSH_GRML_CONF=$HOME/.zsh.grml
[[ -f $ZSH_GRML_CONF ]] && source $ZSH_GRML_CONF

# Vim mode

bindkey -v

# Prompt

PROMPTFILE=/usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
echo $TERM | egrep "(screen|xterm).*" >/dev/null && [[ -f $PROMPTFILE ]] && source $PROMPTFILE && source ~/.promptcfg

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

# Aliases

alias df='df -h'
alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias gitdir='cd $(git rev-parse --show-toplevel)'

alias xclip='xclip -selection clipboard'

alias open='xdg-open'

alias sudo='sudo '

alias less='less -r'

alias temp='cat /sys/class/thermal/thermal_zone*/temp'

alias update-mirrors='sudo reflector --verbose -l 16 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias audio-youtube-dl='noglob youtube-dl -f "bestaudio[ext=m4a]" --no-playlist'
alias m4a-to-mp3='find . -type f -name "*.m4a" -print0 | nice xargs -0 -i -P8 ffmpeg -n -i {} -b:a 320k {}.mp3'

# Functions
mkcd() { mkdir $1 && cd $1 }

watchdir() { while true; do clear && eval $@ && inotifywait -r . @.git 2>/dev/null; done }

# "Better version" aliases
which nvim >& /dev/null && alias vi='nvim' && alias vim='nvim'
which colordiff >& /dev/null && alias diff='colordiff'

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
if [[ ! -o login ]]; then
  NVM_LAZY_LOAD=true
fi
ZSH_NVM=$HOME/conf/zsh-nvm/zsh-nvm.plugin.zsh
[ -s $ZSH_NVM ] && source $ZSH_NVM

# extra
ZSH_EXTRA_CONF=$HOME/.zsh.extra
[[ -f $ZSH_EXTRA_CONF ]] && source $ZSH_EXTRA_CONF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
