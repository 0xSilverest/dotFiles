set EDITOR nvim 

function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "fish: Unknown command '$argv'"
end

zoxide init fish | source

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f $HOME/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH

# coursier
export PATH="$PATH:$HOME/.local/share/coursier/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/texlive/2022/bin/x86_64-linux/"

export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/silverest/.local/share/flatpak/exports/share"

export JAVA_HOME=$(sdk home java current)

set fish_function_path $fish_function_path $HOME/.local/share/omf/pkg/foreign-env/functions

# NNN configs
export NNN_BMS="d:~/Documents;u:/home/silverst/Cam Uploads;D:~/Downloads/"
export NNN_SSHFS='sshfs -o follow_symlinks'
export NNN_COLORS='#b19cd9;5'                  
export NNN_FCOLORS='e3c58677006033f700abc4'
export NNN_TRASH=1      
export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_OPTS="H"
export NNN_PLUG='z:fzopen;j:autojump;p:preview-tui;t:preview-tui-ext'
export PAGER='less -R'
export TERMINAL='kitty'
export PGDATA=/usr/local/var/postgres

# Aliases
alias vim='nvim'
alias ls='exa'
alias ll='exa -l'
alias la='exa -al'
alias cat='bat'
# alias ping='prettyping'
alias nna='nnn -a'
alias nnc='nnn -c'
alias reboot='systemctl reboot'
alias shutdown='systemctl poweroff'
alias cp='cpg -g'
alias mv='mvg -g'

#colors
set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $cyan
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $purple
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground --underline
set -g fish_pager_color_description $comment

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

export SDKMAN_DIR="$HOME/.sdkman"
