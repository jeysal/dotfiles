#!/usr/bin/env zsh

xrandr --auto
# try VirtualBox
xrandr --output VGA-1 --auto --left-of VGA-2
# try desktop
xrandr --output HDMI-0 --left-of DP-1
xrandr --output DVI-I-1 --right-of DP-1
# try notebook
xrandr --output HDMI-1 --right-of eDP-1
xrandr --output DP-1 --right-of eDP-1
xrandr --output DP-2 --right-of eDP-1

# keys
setxkbmap -layout gb -variant mac -option compose:caps
numlockx on

# asus touchpad
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Tapping Enabled" 0
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Accel Speed" 0.5
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Middle Emulation Enabled" 1 # disable the annoying default middle button region
xinput set-prop "ELAN1201:00 04F3:3098 Touchpad" "libinput Disable While Typing Enabled" 0
xinput --map-to-output "ELAN9008:00 04F3:2C82" eDP-1

# beep
xset -b

# background
feh --bg-fill --randomize ~/conf/assets/bg.png /usr/share/backgrounds/archlinux/{archbtw,archwave,archwaveinv,awesome,wave}.png

# polybar
~/.config/polybar/launch.zsh &disown
