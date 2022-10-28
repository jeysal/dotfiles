if uname | grep >/dev/null Darwin; then
  source /opt/X11/lib/X11/xinit/xinitrc
  exit
fi

./.x.sh
prcs -r=143 -- bin/autox >$HOME/.local/share/autox.log &disown

if xrandr | grep >/dev/null 3840x2160; then
  export DPI=210
  export POLYBAR_HEIGHT=64
  xrdb $HOME/.hidpi.Xresources
fi

# detect main monitor
xrandrOutput=$(xrandr -q | grep " connected ")
for monitor in VNC-0 DP-1 DP-0 DisplayPort-1 DisplayPort-0 DVI-D-1 DVI-D-0 HDMI-1 HDMI-0 HDMI1 HDMI0 HDMI-A-1 HDMI-A-0 VGA-1 VGA1 eDP eDP-1 eDP1 eDP-1-1; do
  echo $monitor;
  if echo "$xrandrOutput" | grep "$monitor"; then
    export MAIN_MONITOR=$monitor
  fi
done

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# wm
exec i3 2>&1 | tee $HOME/.local/share/i3.log
