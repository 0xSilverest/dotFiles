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
export PATH="$PATH:/home/silverest/.yarn/bin"

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
alias ping='prettyping'
alias nna='nnn -a'
alias nnc='nnn -c'
alias pencil='strace pencil'

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
export SDKMAN_DIR='/home/silverest/.sdkman'
