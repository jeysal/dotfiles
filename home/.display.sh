set -x
exec >~/.local/share/display.log 2>&1
date

# try VirtualBox
xrandr --output VGA-2 --auto
xrandr --output VGA-1 --auto --left-of VGA-2
# try desktop
xrandr --output DP-1 --auto
xrandr --output HDMI-0 --auto --left-of DP-1
xrandr --output DVI-I-1 --auto --right-of DP-1
# try notebook
xrandr --output eDP-1 --auto
xrandr --output HDMI-1 --auto --left-of eDP-1
xrandr --output DP-1 --auto -right-of eDP-1
xrandr --output DP-2 --auto --right-of eDP-1
# try notebook amdgpu
xrandr --output eDP --auto
xrandr --output HDMI-A-0 --auto --left-of eDP
xrandr --output DisplayPort-0 --auto --right-of eDP
xrandr --output DisplayPort-1 --auto --right-of eDP

# map input devices
xinput --map-to-output "ELAN9008:00 04F3:2C82" eDP-1

# cursor size etc
xrdb -merge ~/.Xresources

# background
feh --bg-fill --randomize ~/conf/assets/bg.png /usr/share/backgrounds/archlinux/{archbtw,archwave,archwaveinv,awesome,wave}.png
