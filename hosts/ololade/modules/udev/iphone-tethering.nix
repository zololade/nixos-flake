{ config, pkgs, ... }:

{
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="05ac", ATTR{idProduct}=="12a8", SYMLINK+="iphone", OWNER="ololade", GROUP="plugdev", MODE="0666"
  '';
}
