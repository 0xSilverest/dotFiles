(import <nixpkgs> { }).haskellPackages.callCabal2nix "my-taffybar" ./. { 
  xdg.configFile."taffybar/taffybar.hs".source = ./config.hs;
}

