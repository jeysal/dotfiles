if uname | grep >/dev/null Darwin; then
  source /opt/X11/lib/X11/xinit/xinitrc
  exit
fi

source $HOME/.x.sh

if xrandr | grep >/dev/null 3840x2160; then
  export DPI=210
  export POLYBAR_HEIGHT=64
  xrdb $HOME/.hidpi.Xresources
fi

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
eval $(ssh-agent -s)
ssh-add
export SSH_AUTH_SOCK

# wm
exec i3
