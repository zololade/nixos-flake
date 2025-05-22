{ config, pkgs, ... }:

let
  sddmWithMultimedia = pkgs.kdePackages.sddm.overrideAttrs (oldAttrs: rec {
    # Add qtmultimedia to build inputs of sddm greeter
    buildInputs = oldAttrs.buildInputs or [] ++ [
      pkgs.kdePackages.qtmultimedia
    ];

    # Also override the greeter package if it’s separate
    # SDDM 2025+ usually uses `sddm-greeter-qt6` as the greeter
    # So let's patch that too:
    passthru = oldAttrs.passthru // {
      greeter = (pkgs.kdePackages.sddm-greeter-qt6.overrideAttrs (greeterAttrs: {
        buildInputs = greeterAttrs.buildInputs or [] ++ [
          pkgs.kdePackages.qtmultimedia
        ];
      }));
    };
  });
in{
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
    wayland.enable = true;

    package = sddmWithMultimedia;
   
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
        ConfFile = "cyberpunk.conf";
      };
    };
  };

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

 }
