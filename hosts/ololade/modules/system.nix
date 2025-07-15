{ config, pkgs, ... }:

{
  #time.timeZone = "Africa/Lagos"; # or your preferred TZ

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
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

