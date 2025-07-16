{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  
  #audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 4096;
      };
    };
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
 
  #displayManager
  services.xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
  };

  #filemanager/usb-connetion
  services.usbmuxd = {
    enable = true;
  };
  services.gvfs.enable = true;
  services.gvfs.package = pkgs.gvfs;
  services.tumbler.enable = true;
  
  #power
  services.tlp.enable = true;
  services.upower.enable = true;
  services.upower.package = pkgs.upower; 

  #hypridle/displayManager
  services.displayManager.defaultSession = "hyprland-uwsm";
  services.hypridle.enable = true;
  
  
  services.fwupd.enable = true;
  services.dbus.enable = true;
  services.flatpak.enable = true; 

  #pam/keyring/polkit
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.gdm.enable = true; 
  security.polkit.enable = true;

  #timezone
  services.automatic-timezoned.enable = true;
  
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

}
