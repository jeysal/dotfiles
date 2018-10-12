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
xmodmap ~/.xmodmap
setxkbmap -layout de -variant nodeadkeys -option compose:caps

numlockx on

# touchpad
xinput set-prop "DLL07D1:01 044E:120B" "libinput Natural Scrolling Enabled" 1

# beep
xset -b

# background
feh --bg-fill --randomize /usr/share/archlinux/wallpaper/archlinux-{aftermath,arrival,underground}.jpg

# polybar
~/.config/polybar/launch.zsh
