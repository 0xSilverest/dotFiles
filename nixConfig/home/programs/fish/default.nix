{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';


  fenv = {
    name = "foreign-env";
    src = pkgs.fishPlugins.foreign-env.src;
  };

  fishConfig = ''
    bind \t accept-autosuggestion 
  '' + fzfConfig; 
in
{
  programs.fish = {
    enable = true;
    plugins = [ customPlugins fenv ];

    promptInit = ''
      eval (direnv hook fish)
      any-nix-shell fish --info-right | source
    '';
    shellAliases = {
      ll   = "ls -a";
      ".." = "cd ..";
      ping = "prettyping";
    };
    shellInit = fishConfig;
  };

  xdg.configFile."fish/functions/fish_prompt.fish".text = customPlugins.prompt;
}
