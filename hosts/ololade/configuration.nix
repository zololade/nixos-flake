# ~/nixos-flake/hosts/ololade/configuration.nix
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./modules/boot.nix
      ./modules/programs.nix
      ./modules/xdg.nix
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/networking.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/users.nix
      ./modules/env.nix
      ./modules/udev/iphone-tethering.nix
     ];

  system.stateVersion = "25.05";

}

