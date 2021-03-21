{ config, pkgs, ... }:

let
  myPolyBar = pkgs.polybar.override {
    alsaSupport   = true;
    mpdSupport    = true;
    pulseSupport  = true;
  };
in
{
    xdg.configFile.".config/polybar/launch.sh".source = ./launch.sh;
    xdg.configFile.".config/polybar/config".source = ./config;
    xdg.configFile.".config/polybar/gpmdp.sh".source = ./gpmdp.sh;
    xdg.configFile.".config/polybar/spotify.sh".source = ./spotify.sh;
    xdg.configFile.".config/polybar/weather.sh".source = ./weather.sh;
    xdg.configFile.".config/polybar/local_and_public_ips.sh".source = ./local_and_public_ips.sh;

    services.polybar = {
      enable = true;
      packages = myPolyBar;
      
    };
}
