#!/bin/zsh
# export GDK_BACKEND="wayland,x11"
# export XDG_CURRENT_DESKTOP="sway"
# export XDG_SESSION_DESKTOP="sway"
# export XDG_SESSION_TYPE="wayland"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    #export XDG_SESSION_TYPE=wayland
    #export XDG_CURRENT_DESKTOP=sway
    # ./.local/bin/hypr

    dbus-run-session sway
  #exec startx
fi
#xmodmap ~/.Xmodmap
