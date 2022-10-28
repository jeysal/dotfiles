#!/usr/bin/env zsh

xrandr --auto
# try VirtualBox
xrandr --output VGA-1 --auto --left-of VGA-2
# try desktop
xrandr --output HDMI-0 --left-of DP-1
xrandr --output DVI-I-1 --right-of DP-1
# try notebook
xrandr --output HDMI-A-0 --right-of eDP
xrandr --output HDMI-A-1 --right-of eDP
xrandr --output DisplayPort-1 --right-of eDP

# keys
setxkbmap -layout gb -variant mac -option compose:caps
numlockx on

# asus input devices
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Tapping Enabled" 0
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Accel Speed" 0.5
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Middle Emulation Enabled" 1 # disable the annoying default middle button region
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Disable While Typing Enabled" 0
xinput --map-to-output "ELAN9008:00 04F3:2C82" eDP

# beep
xset -b

# background
feh --bg-fill --randomize ~/conf/assets/bg.png /usr/share/backgrounds/archlinux/{archbtw,archwave,archwaveinv,awesome,wave}.png

# polybar
~/.config/polybar/launch.zsh &disown
