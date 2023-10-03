set EDITOR nvim

function __fish_command_not_found_handler --on-event fish_command_not_found
    cnf $argv
end

# aliases
#function ls
#    command exa $argv
#end
#
#function ll
#    command exa -l $argv
#end
#
#function la
#    command exa -al $argv
#end 
#
#function cat
#    command bat $argv
#end

function reboot
    command systemctl reboot $argv
end

function shutdown
    command systemctl poweroff $argv
end

#function cp
#    command cpg -g $argv
#end
#
#function mv
#    command mvg -g $argv
#end

function ssh
    command kitty +kitten ssh $argv
end

function clipboard
    command strings $argv ~/.local/share/parcellite/history
end

#function rm
#    command trash $argv
#end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f $HOME/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH

# coursier
set PATH "$PATH:$HOME/.local/share/coursier/bin:$HOME/.yarn/bin:$HOME/.npm/bin:$HOME/bin:/usr/local/lib/node_modules/:$HOME/.ghcup/bin:$HOME/.sdkman/candidates/java/22.3.r17-grl/bin"

set XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/silverest/.local/share/flatpak/exports/share"

set JAVA_HOME "/home/silverest/.sdkman/candidates/java/current"

export GRAALVM_HOME="/home/silverest/.sdkman/candidates/java/22.3.r17-grl/"

#set fish_function_path $fish_function_path $HOME/.local/share/omf/pkg/foreign-env/functions

set BLK "04"
set CHR "04"
set DIR "04"
set EXE "00"
set REG "00"
set HARDLINK "00"
set SYMLINK "06"
set MISSING "00"
set ORPHAN "01"
set FIFO "0F"
set SOCK "0F"
set OTHER "02"

# NNN configs
set NNN_BMS "d:~/Documents;u:/home/silverst/Cam Uploads;D:~/Downloads/"
set NNN_SSHFS 'sshfs -o follow_symlinks'
set NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
set NNN_TRASH 1
set NNN_FIFO '/tmp/nnn.fifo'
set NNN_PLUG 'z:fzopen;j:autojump;p:preview-tui;t:preview-tui-ext;n:!neovide;'
set PAGER 'less -R'
set TERMINAL 'kitty'

## TokyoNight Color Palette
#set -l foreground c0caf5
#set -l selection 33467C
#set -l comment 565f89
#set -l red f7768e
#set -l orange ff9e64
#set -l yellow e0af68
#set -l green 9ece6a
#set -l purple 9d7cd8
#set -l cyan 7dcfff
#set -l pink bb9af7
#
## Syntax Highlighting Colors
#set -g fish_color_normal $foreground
#set -g fish_color_command $cyan
#set -g fish_color_keyword $pink
#set -g fish_color_quote $yellow
#set -g fish_color_redirection $foreground
#set -g fish_color_end $orange
#set -g fish_color_error $red
#set -g fish_color_param $purple
#set -g fish_color_comment $comment
#set -g fish_color_selection --background=$selection
#set -g fish_color_search_match --background=$selection
#set -g fish_color_operator $green
#set -g fish_color_escape $pink
#set -g fish_color_autosuggestion $comment
#
## Completion Pager Colors
#set -g fish_pager_color_progress $comment
#set -g fish_pager_color_prefix $cyan
#set -g fish_pager_color_completion $foreground
#set -g fish_pager_color_description $comment

#set -g NODE_OPTIONS --openssl-legacy-provider
set -e NODE_OPTIONS


# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

zoxide init fish | source

set SDKMAN_DIR "$HOME/.sdkman"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

