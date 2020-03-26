#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

startx
#WLR_DRM_DEVICES=/dev/dri/card1 sway --my-next-gpu-wont-be-nvidia
#sway --my-next-gpu-wont-be-nvidia
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
