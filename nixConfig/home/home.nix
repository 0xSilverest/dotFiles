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
        killall

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
        #blender

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

        # Nix things
        manix
        taffybar
        pkg-config
          
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

  taffybarPkgs = with pkgs.haskellPackages; [
    gtk-sni-tray
    gtk-strut
    gi-xlib
    gi-gtk-hs
    gi-dbusmenugtk3
    gi-dbusmenu
    gi-cairo-render
    gi-cairo
    gi-cairo-connector
    status-notifier-item
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

  polybarPkgs = with pkgs; [
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
  nixpkgs.config.allowUnfree=true; 
  programs.home-manager.enable = true;
 
  imports = (import ./programs) ++ (import ./services);  

  xdg.enable = true;

  home = {
    username      = "silverest";
    homeDirectory = "/home/silverest";
    stateVersion  = "20.09";

    packages = defaultPkgs ++ gitPkgs ++ gnomePkgs ++ haskellPkgs ++ xmonadPkgs ++ taffybarPkgs;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  # notifications about home-manager news
  news.display = "silent";

  # temporarily disable it until there is a fix upstream
  manual = {
    json.enable = false;
    html.enable = false;
    manpages.enable = false;
  };

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

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    taffybar.enable = true;
  };
  
  home-manager = {
      home.file.".config/polybar/launch.sh".source = lib.mkDefault ../../users/shared/.config/polybar/launch.sh;
      home.file.".config/polybar/config".source = ../../.config/polybar/config;
      home.file.".config/polybar/gpmdp.sh".source = ../../.config/polybar/gpmdp.sh;
      home.file.".config/polybar/spotify.sh".source = ../../.config/polybar/spotify.sh;
      home.file.".config/polybar/weather.sh".source = ../../.config/polybar/weather.sh;
      home.file.".config/polybar/local_and_public_ips.sh".source = ../../.config/polybar/local_and_public_ips.sh;
  };
}

