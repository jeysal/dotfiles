(sleep 3 && xmodmap ~/.xmodmap) &

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec startxfce4
