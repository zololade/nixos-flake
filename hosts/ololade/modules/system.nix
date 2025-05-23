{ config, pkgs, ... }:

{
  time.timeZone = "Africa/Lagos"; # or your preferred TZ

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  xdg.terminal-exec.settings = {
    Hyprland = [
      "kitty.desktop"
    ];
    default = [
     "kitty.desktop"
    ];
  };


}

