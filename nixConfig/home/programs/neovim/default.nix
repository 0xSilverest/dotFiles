{ config, lib, pkgs, ... }:

let
  plugins = pkgs.vimPlugins; 

  vimPlugins = with plugins; [
        # Theme
        onedark-vim
        vim-airline
        vim-airline-themes
        vim-css-color
        vim-devicons
        vim-easy-align

        # File management
        nerdtree
        nerdtree-git-plugin

        # Coc Plugins
        coc-nvim
        coc-json 
        coc-metals
        coc-vimtex
        coc-neco

        # Utils
        neomake 
        fzf-vim
        neco-vim
        vimtex
        vim-fish
        vim-fugitive
        vim-nix
        dhall-vim
        vim-scala
        vim-surround
        ale
        ghcid
      ];
 
  baseConfig    = builtins.readFile ./config.vim;
  cocConfig     = builtins.readFile ./coc.vim;
  cocSettings   = builtins.toJSON (import ./coc-settings.nix);
  vimConfig     = baseConfig + cocConfig; 

  neovim-5     = pkgs.callPackage ./dev/nightly.nix {};
  nvim5-config = builtins.readFile ./dev/metals.vim;
  new-plugins  = pkgs.callPackage ./dev/plugins.nix {
    inherit (pkgs.vimUtils) buildVimPlugin;
    inherit (pkgs) fetchFromGitHub;
  };

  nvim5-plugins = with new-plugins; [
    completion-nvim
    diagnostic-nvim
    nvim-lsp
    nvim-metals
  ];
in
{
  programs.neovim = {
    enable       = true;
    extraConfig  = vimConfig;
    package      = neovim-5;
    plugins      = vimPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true; # for coc.nvim
    withPython   = true; # for plugins
    withPython3  = true; # for plugins
  };

  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
  };
}
