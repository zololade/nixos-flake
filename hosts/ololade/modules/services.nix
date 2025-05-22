{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  # Add more services like pipewire, bluetooth, printing, etc. later
 
  services.pulseaudio.enable = false; # Important: disable PulseAudio

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
   };

  services.usbmuxd.enable = true;
  services.tlp.enable = true;
  services.upower.enable = true;
  services.upower.package = pkgs.upower; 
  #services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";
  services.desktopManager.plasma6.enable = false; # Disable if KDE was ever enabled
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
  #services.displayManager.sddm.wayland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.hyprland.withUWSM = true;

  services.dbus.enable = true;
  services.geoclue2.enable = true;
  services.flatpak.enable = true;
  programs.firefox.enable = true;
  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; 
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  services.dbus.packages = with pkgs; [ gnome-keyring ];
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;


  
  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
 }
