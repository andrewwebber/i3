xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
