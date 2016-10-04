# Command line
bindkey -v
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

PROMPTFILE='/usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme'
[[ $TERM == "xterm-256color" ]] && [[ -f $PROMPTFILE ]] && source $PROMPTFILE && source ~/.promptcfg

# Completion
zstyle :compinstall filename '/home/seckinger/.zshrc'
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Aliases
alias ls='ls -hF --color=tty'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias lr='ls -lAR'

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

# local config
LOCALCONFIGFILE='~/.zshlocal'
[[ -f $LOCALCONFIGFILE ]] && source $LOCALCONFIGFILE
