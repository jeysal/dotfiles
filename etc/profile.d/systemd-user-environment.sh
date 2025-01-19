set -o allexport
source <(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
else
  SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi
set +o allexport
