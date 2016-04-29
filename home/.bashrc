[[ "$-" != *i* ]] && return # If not running interactively, don't do anything

# Prompt

function _update_ps1() {
    PS1="$(~/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#PS1='\[\033[1;96m\]\t \[\033[1;31m\]\u@\h [\!] \[\033[1;95m\]\w\[\033[1;96m\]$(__git_ps1 " (%s)")\[\033[1;31m\] > \[\033[0m\]'

# Completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion

# SSH
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS` > /dev/null
	trap "kill $SSH_AGENT_PID" 0
fi

# Misc
export HISTSIZE=''
export EDITOR='vim'
export PAGER='less'

# Aliases
alias df='df -h'
alias du='du -h'

alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -hF --color=tty'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias lr='ls -lAR'

alias fuck='sudo $(history -p !!)'

alias ..='cd ..'
alias ...='cd ../..'
alias gitdir='cd $(git rev-parse --show-toplevel)'

alias diff='colordiff'

alias vi='vim'

# Functions
nginxhere() {
    CONFIGLOCATION=$(mktemp)
    cat <<EOF > $CONFIGLOCATION
events {
}

http {
    include /etc/nginx/mime.types;

    default_type application/octet-stream;

    sendfile on;

    server {
        listen ${1:-8080};
        root "$PWD";
        autoindex on;

        location / {
        }
    }
}
EOF
    nginx -c $(realpath $CONFIGLOCATION)
}

if [[ "$OSTYPE" =~ cygwin ]]; then

    export PATH='/usr/sbin:'$PATH

    alias su='cygstart --action=runas wscript "C:\Users\seckinger\Documents\custompath\xfce4term.js \"$PWD\""'
    alias sudo='cygstart --action=runas'

    alias pgit='~/pgit'

    wtf() { echo " ----- TYPE $@ ----- "; type "$@"; echo " ----- WHERE $@ ----- "; where "$@"; echo " ----- WHATIS $@ ----- "; whatis "$@"; }
    expl() { explorer $(cygpath -w "$PWD"); }

fi
