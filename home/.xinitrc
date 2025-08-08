#!/bin/bash
if uname | grep >/dev/null Darwin; then
  source /opt/X11/lib/X11/xinit/xinitrc
  exit
fi

xrandrOutput=$(xrandr -q | grep " connected ")
echo Detecting main monitor
echo $xrandrOutput
for monitor in VNC-0 DP-1 DP-0 DisplayPort-1 DisplayPort-0 DVI-D-1 DVI-D-0 HDMI-1 HDMI-0 HDMI1 HDMI0 HDMI-A-1 HDMI-A-0 VGA-1 VGA1 eDP eDP-1 eDP1 eDP-1-1; do
  echo $monitor;
  if echo "$xrandrOutput" | grep "$monitor"; then
    export MAIN_MONITOR=$monitor
  fi
done

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# if starting a VNC server from SSH, forget that we're in SSH because we'll use the session from VNC client
unset SSH_CONNECTION

~/.x.sh

# wm
exec i3 2>&1 | tee $HOME/.local/share/i3.log
