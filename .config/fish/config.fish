set EDITOR nvim 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/silverest/.sdkman"
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/silverest/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/silverest/.ghcup/bin $PATH
