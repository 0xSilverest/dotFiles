set EDITOR nvim
set VISUAL nvim

functions -c fish_right_prompt __lambda_right_prompt_original

function fish_right_prompt
    set -l original_output (__lambda_right_prompt_original)
    if test -n "$original_output"
        printf '%s ' $original_output
    end
end

function __fish_command_not_found_handler --on-event fish_command_not_found
    cnf $argv
end

# aliases
function ls
    command eza $argv
end

function ll
    command eza -l $argv
end

function la
    command eza -al $argv
end

function cat
    command bat $argv
end

function reboot
    command systemctl reboot $argv
end

function shutdown
    command systemctl poweroff $argv
end

function map-pen
    command xinput map-to-output "HID 256c:006d Pen Pen (0)" DP-2
end

set -gx QT_QPA_PLATFORMTHEME qt6ct

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

#function rm
#    command trash $argv
#end

# coursier
set PATH "$PATH:$HOME/.local/share/coursier/bin:$HOME/.yarn/bin:$HOME/.npm-global/bin:$HOME/bin:/usr/local/lib/node_modules/"

set WINEDLLPATH $WINEDLLPATH:/opt/discord-rpc/bin64:/opt/discord-rpc/bin32

set QT_QPA_PLATFORMTHEME "qt6ct"

set XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/silverest/.local/share/flatpak/exports/share"

set JAVA_HOME "/home/silverest/.sdkman/candidates/java/current"

export GRAALVM_HOME="/home/silverest/.sdkman/candidates/java/17.0.9-graalce/"

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

## Twilight Serpent
# Color palette
set -l foreground e5e5e5
set -l selection 4A4559
set -l comment 5A607A
set -l red ff3355
set -l orange ff9966
set -l yellow ffcb6b
set -l green c3e88d
set -l purple 9C8CE6
set -l cyan 89ddff
set -l pink ff5370
set -l blue 82aaff

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Prompt colors
set -g fish_color_cwd $yellow
set -g fish_color_user $green
set -g fish_color_host $blue

# Git prompt colors
set -g __fish_git_prompt_color_branch $purple
set -g __fish_git_prompt_color_upstream $cyan
set -g __fish_git_prompt_color_staged $green
set -g __fish_git_prompt_color_stashed $blue
set -g __fish_git_prompt_color_unstaged $orange
set -g __fish_git_prompt_color_untracked $red

#set -g NODE_OPTIONS --openssl-legacy-provider
set -e NODE_OPTIONS

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

zoxide init fish | source

# Created by `pipx` on 2024-02-26 09:47:30
set PATH $PATH /home/silverest/.local/bin


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/silverest/.opam/opam-init/init.fish' && source '/home/silverest/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

set -gx SDKMAN_DIR "$HOME/.sdkman"
set -gx PATH "$HOME/.sdkman/candidates/java/current/bin" $PATH
