# try desktop nouveau
xrandr --output HDMI-1 --left-of DVI-D-1
# try desktop nvidia
xrandr --output HDMI-0 --left-of DVI-D-0
# try notebook
xrandr --output VGA1 --right-of HDMI1
xrandr --output eDP1 --left-of HDMI1
# try VM
xrandr --output VGA-3 --auto --right-of VGA-2
xrandr --output VGA-2 --auto --left-of VGA-3
xrandr --output VGA-2 --auto --right-of VGA-1
xrandr --output VGA-1 --auto --left-of VGA-2

# keys
setxkbmap -layout de -variant nodeadkeys
xmodmap ~/.xmodmap

numlockx on

# touchpad
xinput --set-prop "AlpsPS/2 ALPS DualPoint TouchPad" "libinput Natural Scrolling Enabled" 1

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# background
feh --bg-fill /usr/share/archlinux/wallpaper/archlinux-arrival.jpg

# wm
exec i3
