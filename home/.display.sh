set -x
exec >~/.local/share/display.log 2>&1
date

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

# map input devices
xinput --map-to-output "ELAN9008:00 04F3:2C82" eDP

# background
feh --bg-fill --randomize ~/conf/assets/bg.png /usr/share/backgrounds/archlinux/{archbtw,archwave,archwaveinv,awesome,wave}.png
