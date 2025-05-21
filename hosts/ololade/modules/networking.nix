{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "ololade";
  networking.firewall.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  hardware.bluetooth.package = pkgs.bluez;

  services.dbus.enable = true;
  services.usbmuxd.enable = true;



}
