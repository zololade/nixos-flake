{ config, lib, pkgs, ... }:

{

 boot = {
    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 1;
      consoleMode = "auto";
    };
    
    loader.efi.canTouchEfiVariables = true;

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
  };

}