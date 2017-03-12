# Vim mode

bindkey -v

# Prompt

PROMPTFILE=/usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
echo $TERM | grep "xterm.*" >/dev/null && TERM=xterm-256color && [[ -f $PROMPTFILE ]] && source $PROMPTFILE && source ~/.promptcfg

# Aliases

alias df='df -h'
alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias gitdir='cd $(git rev-parse --show-toplevel)'

alias xclip='xclip -selection clipboard'

alias sudo='sudo '

# "Better version" aliases
which vim >& /dev/null && alias vi='vim'
which colordiff >& /dev/null && alias diff='colordiff'

# History
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# SSH
plugins=(git ssh-agent)
