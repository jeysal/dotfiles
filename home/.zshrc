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

alias update-mirrors='sudo reflector --verbose -l 16 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias audio-youtube-dl='noglob youtube-dl -f "bestaudio[ext=m4a]" --no-playlist'

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

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"';
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# nvm
NVM_INIT_SCRIPT=/usr/share/nvm/init-nvm.sh
[[ -f $NVM_INIT_SCRIPT ]] && source $NVM_INIT_SCRIPT

# extra
ZSH_EXTRA_CONF=$HOME/.zsh.extra
[[ -f $ZSH_EXTRA_CONF ]] && source $ZSH_EXTRA_CONF
