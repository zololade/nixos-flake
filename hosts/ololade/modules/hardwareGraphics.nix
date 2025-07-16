{ config, lib, pkgs, ... }:

{
 
  #hardware.graphics.enable = true;     
  #hardware.graphics.enable32Bit = true;    

  #hardware.graphics.extraPackages = with pkgs; [
    #intel-media-driver   
    #intel-vaapi-driver   
    #libva-utils          
    #intel-ocl
  #];

  #hardware.graphics.extraPackages32 = with pkgs; [
    #intel-media-driver   
    #intel-vaapi-driver   
  #];

}