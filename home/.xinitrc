source $HOME/.x.sh

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# background
feh --bg-fill /usr/share/archlinux/wallpaper/archlinux-arrival.jpg

# wm
exec i3
