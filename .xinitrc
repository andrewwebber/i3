dbus-update-activation-environment --systemd DISPLAY
xrdb ~/.Xresources
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
exec i3
