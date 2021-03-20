{ config, lib, pkgs, stdenv, ... }:

let 
    defaultPkgs = with pkgs; [    
        
        # Terminal and stuff
        alacritty 
        wget 
        curl
        tldr
        tree
        dbus	
        vifm
        nnn
        neofetch

        # Wine 
        lutris 

        # Browsers
        brave
        firefox
        vimb

        # Editors
        vim 
        jetbrains.idea-community
        android-studio

        # Shell
        fish
        zsh
        bash

        # File manager 
        Dolphin

        # DevTools
        postman
        newman
        insomnia

        # Latex
        texlive.combined.scheme-full
        texlab 
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

        # Audio things
        playerctl
        pavucontrol
        paprefs
        pasystray
        playerctl

        # etc 
        dmenu
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

  gnomePkgs = with pkgs.gnome3; [
    eog            
    evince         
    gnome-calendar 
    nautilus       
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
    jdk
    sbt
    scala
  ];

  xmonadPkgs = with pkgs; [
    networkmanager_dmenu
    networkmanagerapplet
    xcape
    xorg.xkbcomp
    xorg.xmodmap
    xorg.xrandr  
    rofi 
    nitrogen
  ];


  haskellPkgs = with pkgs.haskellPackages; [ 
    brittany
    cabal2nix                
    cabal-install
    ghc
    haskell-language-server    
    nix-tree
    latex
    hlint
  ];

  taffybarPkgs = with pkgs; [
    font-awesome-ttf
    material-design-icons
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
    #steam-run-native
    #(steam.override { extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ]; nativeOnly = true; }).run
    #(steam.override { withPrimus = true; extraPkgs = pkgs: [ bumblebee glxinfo ]; nativeOnly = true; }).run
    #(steam.override { withJava = true; })
  ];

  in
{
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = (import ./programs) ++ (import ./services);

  xdg.enable = true;

  #programs.steam.enable = true;

  home = {
    username      = "silverest";
    homeDirectory = "/home/silverest";
    stateVersion  = "20.09";

    packages = defaultPkgs ++ gitPkgs ++ gamingPkgs ++ haskellPkgs ++ xmonadPkgs ++ gnomePkgs ++ polybarPkgs ++ compilers ++ lsps ++ fonts;

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
