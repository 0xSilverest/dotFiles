# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; 

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services = {
	gnome3.gnome-keyring.enable = true;
	
	dbus = {
		enable = true;
		socketActivated = true;
		packages = [ pkgs.gnome3.dconf ];
	};

	xserver = {
		enable = true;
		startDbusSession = true;
		layout = "us";
	
		libinput.enable = true;
	 
		displayManager.defaultSession = "none+xmonad";		

		windowManager.xmonad = {
			enable = true;
			enableContribAndExtras = true;		
		};

		 xkbOptions = "eurosign:e";
	}; 
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.silverest = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Browsers
    brave
    firefox
    ungoogle-chromium
    vimb

    # Editors
    vim
    vi
    nvim
    emacs
    jetbrains.idea-community
    android-studio

    # Shell
    fish
    zsh
    bash
    
    # Network
    networkmanager_dmenu
    networkmanagerapplet
    nitrogen

    # Display 
    xcape
    xorg.xkbcomp
    xorg.xmodmap
    xorg.xrandr

    # Wine
    wine
    lutris
    
    # xmonad
    haskellPackages.xmobar
    rofi
    material-design-icons
    
    #terminals
    konsole
    alacritty 

    #terminal tools
    wget 
    curl
    tldr
    tree
    dbus	
    vifm

    # terminal fonts
    fira-code
    font-awesome-ttf
    jetbrains-mono

    # compilers
    ghc
    gcc
    python
    python3
    python39
    ruby_2_7
    ruby
    sqlite
    nodejs
    
    # GHC Tools
    haskellPackages.brittany
    haskellPackages.cabal2nix
    haskellPackages.cabal-install
    haskellPackages.ghc
    haskellPackages.haskell-language-server 
    haskellPackages.hoogle
    haskellPackages.nix-tree
    haskellPackages.latex

    # Vim Plugins
    vimPlugins.latex-box
    vimPlugins.vim-latex-live-preview

    # Git
    git
    git-secrets

    # Latex
    texlive.combined.scheme-full
    texlab
    biber
    tikzit

    # Gaming
    steam
    steamPackages.steam
    steamPackages.steam-runtime
    
    # Emulators
    pcsx2
    pcsxr
    dolphinEmu
    virtualbox

    # etc
    okular
    ebook_tools
    graphviz
    plantuml 
    zip
    htop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

