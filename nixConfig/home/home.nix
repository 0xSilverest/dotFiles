{ config, lib, pkgs, stdenv, ... }:

let 
    defaultPkgs = with pkgs; [    
        konsole
        alacritty 
        wget 
        curl
        tldr
        tree
        dbus	
        vifm

        # Wine
        wine
        lutris 

        # Browsers
        brave
        firefox
        ungoogled-chromium
        vimb

        # Editors
        vim
        neovim 
        jetbrains.idea-community
        android-studio

        # Shell
        fish
        zsh
        bash
        
        # DevTools
        postman
        newman
        insomnia

        # Latex
        texlive.combined.scheme-full
        texlab
        biber
        tikzit   

        # HyperVisors
        virtualbox 
        docker

        # Video players
        mpv
        vlc

        # Ebooks
        calibre 
        okular
        ebook_tools

        # Those things to feel like an artist
        obs-studio 
        gimp
        inkscape
        kdenlive
        blender

        # etc 
        fzf
        cmus
        libreoffice
        graphviz
        plantuml 
        zip
        htop
        qbittorrent
        xclip
        prettyping

        binutils-unwrapped
  ];

  gitPkgs = with pkgs.gitAndTools; [ 
    git-secrets
    diff-so-fancy
    hub
    tig
  ];

  lsps = with pkgs; [
    rnix-lsp
    dhall-lsp-server
    metals
  ];

  compilers = with pkgs; [
    ghc
    gcc 
    python3 
    ruby
    sqlite
    nodejs
    unstable.jdk
    unstable.sbt
    unstable.scala
  ];

  xmonadPkgs = with pkgs; [
    networkmanager_dmenu
    networkmanagerapplet
    xcape
    xorg.xkbcomp
    xorg.xmodmap
    xorg.xrandr  
    taffybar
    rofi 
    nitrogen
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    taffybar
    brittany
    cabal2nix                
    cabal-install
    ghc
    haskell-language-server    
    nix-tree
    latex
  ];

  taffybarPkgs = with pkgs; [
    font-awesome-ttf
    material-design-icons
  ];

  nodePkgs = with pkgs.nodePackages; [
    npm
  ];

  fonts = with pkgs; [
    fira-code
    font-awesome-ttf
    jetbrains-mono
  ];

  gamingPkgs = with pkgs; [
    pcsx2
    pcsxr
    dolphinEmu
    wineWowPackages.stable
    lutris 
    steam-run-native
    (steam.override { extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ]; nativeOnly = true; }).run
    (steam.override { withPrimus = true; extraPkgs = pkgs: [ bumblebee glxinfo ]; nativeOnly = true; }).run
    (steam.override { withJava = true; })
  ];

  in
{
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  #imports = (import ./programs) ++ ++ [(import ./development)];

  xdg.enable = true;

  programs.steam.enable = true;

  home = {
    username      = "silverest";
    homeDirectory = "/home/silverest";
    stateVersion  = "20.09";

    packages = defaultPkgs ++ gitPkgs ++ gamingPkgs ++ haskellPkgs ++ xmonadPkgs ++ taffybarPkgs ++ compilers ++ lsps ++ fonts;

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
    };
  };

  # notifications about home-manager news
  news.display = "silent";

  programs = {
    bat.enable = true;

    broot = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
      enableFishIntegration = true;
      enableNixDirenvIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    gpg.enable = true;

    htop = {
      enable = true;
      sortDescending = true;
      sortKey = "PERCENT_CPU";
    };

    jq.enable = true;
    ssh.enable = true;
  };

  services = {
    flameshot.enable = true;
  };

}
