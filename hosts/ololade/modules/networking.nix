{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "ololade";
  networking.firewall.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.dbus.enable = true;
  services.usbmuxd.enable = true;



}
