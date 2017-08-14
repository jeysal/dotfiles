setxkbmap -layout de -variant nodeadkeys
xmodmap ~/.xmodmap

numlockx on

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

feh --bg-fill /usr/share/archlinux/wallpaper/archlinux-arrival.jpg

exec i3
