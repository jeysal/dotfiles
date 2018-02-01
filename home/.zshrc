# Vim mode

bindkey -v

# Prompt & tmux

PROMPTFILE=/usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
echo $TERM | egrep "(screen|xterm).*" >/dev/null && TERM=xterm-256color && [[ -f $PROMPTFILE ]] && source $PROMPTFILE && source ~/.promptcfg

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

# extra
ZSH_EXTRA_CONF=$HOME/.zsh.extra
[[ -f $ZSH_EXTRA_CONF ]] && source $ZSH_EXTRA_CONF
