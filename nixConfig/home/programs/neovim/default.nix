{ config, lib, pkgs, ... }:

let
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
        coc-json
        coc-nvim
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
    ]
