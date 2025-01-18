if [[ ! -z "$IS_MACOS" ]]; then
  # grml in user folder (for systems that do not have it installed globally)
  ZSH_GRML_CONF=$HOME/.grml.zsh
  [[ -f $ZSH_GRML_CONF ]] && source $ZSH_GRML_CONF
fi

prompt off # We will configure our own prompt

# Vim mode

bindkey -v

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

alias grep='grep -E'
alias sed='sed -r --follow-symlinks'

alias gdmb='git diff $(git merge-base origin/master HEAD)'
alias groot='cd $(git rev-parse --show-toplevel)'

alias y='yarn'

alias sc='systemctl'
alias scu='systemctl --user'

alias :q='exit'
alias :qa='exit'

alias xclip='xclip -r -selection clipboard'
alias icat='kitty +kitten icat'

[[ ! -z "$IS_MACOS" ]] || alias open='xdg-open'

alias nice='nice '

alias less='less -r'

alias temp='cat /sys/class/thermal/thermal_zone*/temp'

alias dnd-on='dunstctl set-paused true'
alias dnd-off='dunstctl set-paused false'

function dns-dhcp() {
  sudo resolvectl dns $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) $(nmcli -f name con show --active | grep -v NAME | awk '{$1=$1};1' | xargs -d "\n" nmcli con show | zx --eval 'console.log(/^DHCP4\.OPTION.+\sdomain_name_servers\s*=\s*([\d\.]+)$/m.exec(await stdin())[1])') && sudo resolvectl dnsovertls $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) no # TODO deal with multiple space-separated DNS servers
}
function dns-cf() {
  sudo resolvectl dns $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) 1.1.1.1 && sudo resolvectl dnsovertls $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) no
}
function dns-quad9() {
  sudo resolvectl dns $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) 9.9.9.9 && sudo resolvectl dnsovertls $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) no
}
function dns-default-route() {
  sudo resolvectl dns $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) $(ip route show default | cut -d " " -f 3) && sudo resolvectl dnsovertls $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1) no
}
function dns-revert() {
  sudo resolvectl revert $(nmcli dev | grep " connected" | head -n1 | cut -d " " -f1)
}

alias rsync='rsync -aP'

sshvnc0() { ssh -fL 9901:localhost:5900 $* sleep 10; vncviewer localhost:9901 }
sshvnc1() { ssh -fL 9902:localhost:5901 $* sleep 10; vncviewer localhost:9902 }

alias update-mirrors='sudo reflector --verbose -l 16 -p https --sort rate --save /etc/pacman.d/mirrorlist'
alias audio-yt-dlp='noglob yt-dlp -f "bestaudio" --cookies-from-browser=brave+gnomekeyring --no-playlist --extract-audio --add-metadata'
alias m4a-to-mp3='find . -type f -name "*.m4a" -print0 | nice xargs -0 -i -P8 ffmpeg -n -i {} -b:a 320k {}.mp3'

alias cdtmp="cd $(mktemp -d)"
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

which autorandr >& /dev/null && test "$DISPLAY" && for profile in $(autorandr --list); do alias $profile="autorandr -l $profile"; done

# "Better version" aliases
which colordiff >& /dev/null && alias diff='colordiff'
which nvim >& /dev/null && alias vi='nvim' && alias vim='nvim'

# aliases from oh-my-zsh
source $HOME/conf/oh-my-zsh/plugins/git/git.plugin.zsh
source $HOME/conf/oh-my-zsh/plugins/systemd/systemd.plugin.zsh

# History
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# SSH
plugins=(git ssh-agent)

# tmux
if [ -n "$TMUX" ]; then
  function refresh_tmux_env {
    eval "$(tmux show-environment -s SSH_AUTH_SOCK)"
  }
else
  function refresh_tmux_env { }
fi
function preexec {
  refresh_tmux_env
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

# fnm
eval "$(fnm env --use-on-cd)"

# Prompt
for PROMPTFILE in {/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme,$HOME/.powerlevel10k/powerlevel10k.zsh-theme}; do
  echo $TERM | grep -E "(screen|xterm).*" >/dev/null && [[ -f $PROMPTFILE ]] && source ~/.promptcfg && source $PROMPTFILE
done

# extra
ZSH_EXTRA_CONF=$HOME/.extra.zsh
[[ -f $ZSH_EXTRA_CONF ]] && source $ZSH_EXTRA_CONF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
