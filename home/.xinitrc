# try desktop
xrandr --output HDMI-0 --left-of DVI-D-0
# try notebook
xrandr --output HDMI-1 --left-of eDP1
xrandr --output VGA-1 --right-of eDP1

# keys
setxkbmap -layout de -variant nodeadkeys
xmodmap ~/.xmodmap

numlockx on

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# background
feh --bg-fill /usr/share/archlinux/wallpaper/archlinux-arrival.jpg

# wm
exec i3
