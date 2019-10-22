#!/usr/bin/env zsh

xrandr --auto
# try VirtualBox
xrandr --output VGA-1 --auto --left-of VGA-2
# try desktop nvidia
xrandr --output HDMI-0 --left-of DP-1
xrandr --output DVI-D-0 --right-of DP-1
# try notebook nvidia
xrandr --output DP-2 --right-of HDMI-1 --rotate left
xrandr --output eDP-1 --left-of HDMI-1

# keys
setxkbmap -layout gb -variant mac -option compose:caps
numlockx on

# touchpad
xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 0
xinput set-prop "DELL07E6:00 06CB:76AF Touchpad" "libinput Accel Speed" 1

# beep
xset -b

# background
feh --bg-fill --randomize /usr/share/backgrounds/archlinux/archlinux-{aftermath,arrival,underground}.jpg

# polybar
~/.config/polybar/launch.zsh
