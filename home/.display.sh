set -x
exec >~/.local/share/display.log 2>&1
date

# map input devices
xinput --map-to-output "ELAN9008:00 04F3:2C82" eDP-1

# cursor size etc
xrdb -merge ~/.Xresources

# background
feh --bg-fill --randomize ~/conf/assets/bg.png /usr/share/backgrounds/archlinux/{archbtw,archwave,archwaveinv,awesome,wave}.png
