if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
source ~/projects/i3/.config/fish/fish_greeting.fish
source ~/projects/i3/.config/fish/conf.d/abbr.fish
source ~/projects/i3/.config/fish/functions.fish

set -gx EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim

set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
set -e SSH_AGENT_PID
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent