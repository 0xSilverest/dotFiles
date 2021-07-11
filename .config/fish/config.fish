set EDITOR nvim 

function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "fish: Unknown command '$argv'"
end

function __jump_add --on-variable PWD
  status --is-command-substitution; and return
  jump chdir
end

function __jump_hint
  set -l term (string replace -r '^j ' '' -- (commandline -cp))
  jump hint "$term"
end

function j
  set -l dir (jump cd "$argv")
  test -d "$dir"; and cd "$dir"
end

complete --command j --exclusive --arguments '(__jump_hint)'

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/silverest/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/silverest/.ghcup/bin $PATH

# coursier
export PATH="$PATH:/home/silverest/.local/share/coursier/bin"

export JAVA_HOME="/usr/lib/jvm/default/"

set fish_function_path $fish_function_path $HOME/.local/share/omf/pkg/foreign-env/functions

fenv source /etc/profile.d/nix.sh

# NNN configs
export NNN_BMS='d:~/Documents;u:/home/user/Cam Uploads;D:~/Downloads/'
export NNN_SSHFS='sshfs -o follow_symlinks'
export NNN_COLORS='#b19cd9;5'                  
export NNN_FCOLORS='e3c58677006033f700abc4'
export NNN_TRASH=1      
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="H"
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
alias ping='prettyping'
alias nna='nnn -a'
alias nnc='nnn -c'
alias pencil='strace pencil'

#colors
set fish_color_error "#ff5370"
set fish_color_command "#1fcaf4" --medium
set fish_color_param "#5fdfff"
set fish_pager_color_prefix white
set fish_pager_color_selection "#b19cd9" --bold
set fish_pager_color_description "#e3be7a"
set fish_pager_color_progress white --bold
set fish_pager_color_selected_prefix "#ff5370" --bold --underline
set fish_pager_color_selected_description "#e3be7a" --bold
set fish_pager_color_selected_completion "#ff5370" --underline

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR='/home/silverest/.sdkman'
