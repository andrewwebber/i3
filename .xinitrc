#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
#export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
#dbus-update-activation-environment --systemd DISPLAY

xrdb ~/.Xresources
eval `ssh-agent`
export SSH_AUTH_SOCK
exec i3
