#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

startx
#WLR_DRM_DEVICES=/dev/dri/card1 sway --my-next-gpu-wont-be-nvidia
#sway --my-next-gpu-wont-be-nvidia
