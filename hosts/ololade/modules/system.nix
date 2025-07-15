{ config, pkgs, ... }:

{
  #time.timeZone = "Africa/Lagos"; # or your preferred TZ

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  
  security.polkit.enable = true;

  #systemd
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };


  #swap
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  #garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly"; # or "daily", "monthly", etc.
    options = "--delete-older-than 7d"; # Example: keep everything from the last 7 days
  };

  #nix
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

}

