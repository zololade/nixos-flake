# ~/nixos-flake/hosts/ololade/configuration.nix
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/networking.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/users.nix
      ./modules/env.nix
      ./modules/udev/iphone-tethering.nix
     ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 1;
    consoleMode = "auto";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=3"
  ];

  #swap
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  #garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly"; # or "daily", "monthly", etc.
    options = "--delete-older-than 7d"; # Example: keep everything from the last 7 days
  };  

#  nix = {
#    settings = {
#      experimental-features = [ "nix-command" "flakes" ];
#    };
#  };

  system.stateVersion = "24.11"; # Did you read the comment?

}

