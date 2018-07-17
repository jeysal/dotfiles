source $HOME/.x.sh

# see arch wiki
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# ssh agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# background
BACKGROUND_IMAGES=(/usr/share/archlinux/wallpaper/archlinux-{aftermath,arrival,underground}.jpg)
feh --bg-fill ${BACKGROUND_IMAGES[$(( $RANDOM % ${#BACKGROUND_IMAGES[@]} + 1 ))]}

# wm
exec i3
