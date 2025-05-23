{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "ololade";
  networking.firewall.enable = true;

  # Bluetooth
  hardware.bluetooth.settings = {
   General = {
    Enable = "Source,Sink,Media,Socket";
    Experimental = true;
   };
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
