{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
      pager  = "diff-so-fancy | less --tabs=4 -RFX";
    };
    init.defaultBranch = "main";
  };
in
{
  programs.git = {
    enable = true;
    aliases = {
      comod = "commit -a -m";
      br = "branch";
      co = "checkout";
      st = "status";
    };
    extraConfig = gitConfig;
    ignores = [
      "*.bloop"
      "*.bsp"
      "*.metals"
      "*.metals.sbt"
      "*metals.sbt"
      "*.direnv"
      "*.envrc"        
      "*hie.yaml"      
      "*.mill-version" 
      "*.jvmopts"      
    ];
    userEmail = "silverest12@gmail.com";
    userName = "silverest12";
  };
}
