{ config, lib, pkgs, ... }:

{
 
  hardware.graphics.enable = true;     
  hardware.graphics.enable32Bit = true;    

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-vaapi-driver
    libvdpau-va-gl
    vpl-gpu-rt
    intel-media-sdk
  ];
}
