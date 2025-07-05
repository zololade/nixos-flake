{ config, pkgs, ... }:

{

  virtualisation.docker.enable = true;

  users.users.ololade = {
    isNormalUser = true;
    description = "Ololade";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
      vlc
      libreoffice
    ];
  };

  #gtk
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-rosewater";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "catppuccin-mocha-rosewater-cursors";
      package = pkgs.catppuccin-cursors;
      size = 24;
    };
  };

}
