{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  networking.hostName = "ololade";
  networking.firewall.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;
  networking.tempAddresses = "enabled";

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
