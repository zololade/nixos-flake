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

 boot = {
    # Suppress kernel and system messages
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "udev.log_priority=3"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=false"
    ];

    # Optional: Enable Plymouth for a graphical splash screen
    plymouth.enable = true;
    plymouth.theme = "nixos-bgrt";
    plymouth.themePackages = with pkgs; [ 
      nixos-bgrt-plymouth
    ];
    # You can customize the theme and other settings as needed
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

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}

