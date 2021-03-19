{ fontSize, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      background_opacity = 0.85;
      bell = {
        animation = "EaseOutExpo";
        duration = 2;
        color = "#ffffff";
      };
      colors = {
        primary = {
          background = "#111111";
          foreground = "#ffffff";
        };
      };
      font = {
        normal = {
          family = "Fira Code";
          style = "Light";
        };
        size = fontSize;
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.fish}/bin/fish";
      window = {
        decorations = "full";
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}

