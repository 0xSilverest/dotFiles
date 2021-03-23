set EDITOR nvim 

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/silverest/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/silverest/.ghcup/bin $PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR='/home/silverest/.sdkman'

set fish_function_path $fish_function_path $HOME/.local/share/omf/pkg/foreign-env/functions

fenv source /etc/profile.d/nix.sh

alias vim='nvim'
alias ls='exa'
alias ll='exa -l'
alias la='exa -al'
alias cat='bat'
alias ping='prettyping'
