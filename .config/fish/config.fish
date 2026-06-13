if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
source ~/projects/i3/.config/fish/fish_greeting.fish
source ~/projects/i3/.config/fish/conf.d/abbr.fish
source ~/projects/i3/.config/fish/functions.fish

# Set these globally so they are inherited by child processes
set -gx XDG_SESSION_TYPE wayland
set -gx XDG_CURRENT_DESKTOP sway
# set -gx WLR_DRM_DEVICES /dev/dri/card1:/dev/dri/card0

set -gx EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim
set -gx BROWSER firefox
set -gx ANTHROPIC_BASE_URL http://localhost:8012
set -gx ANTHROPIC_AUTH_TOKEN testing123
set -gx ROCR_VISIBLE_DEVICES "GPU-0248d71683dbc479"
set -gx OPENCODE_EXPERIMENTAL_PLAN_MODE 1
set -gx MOZ_ENABLE_WAYLAND 1

set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
set -e SSH_AGENT_PID
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

source /opt/google-cloud-cli/path.fish.inc

fish_add_path ~/.cargo/bin/
fish_add_path ~/.local/bin/
fish_add_path /opt/cuda/bin/
fish_add_path ~/projects/llama.cpp/build/bin/

if test (tty) = /dev/tty1
    exec dbus-run-session sway
    #sway 
    # || 
    #WLR_DRM_DEVICES=/dev/dri/card1 sway 
    # dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
    #|| sway --unsupported-gpu
end
