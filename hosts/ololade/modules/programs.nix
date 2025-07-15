{ config, lib, pkgs, ... }:

{
  #hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprland.withUWSM = true;
  programs.uwsm.enable = true;

  #additional programs
  programs.firefox.enable = true;
  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
  programs.seahorse.enable = true; 

  #java
  programs.java = {
    enable = true;
    package = pkgs.jdk; # This installs the latest LTS version of OpenJDK
  };
  
  #bar
  programs.waybar.enable = true;

  #filemanager
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [ 
    thunar-archive-plugin 
    thunar-volman 
    thunar-dropbox-plugin
    thunar-media-tags-plugin
    thunar-vcs-plugin
  ];
  programs.partition-manager.enable = true;

  #terminal
  programs.fish = {
    enable = true;
  };
  programs.starship = {
    enable = true;
  };
  programs.zoxide.enable = true;
  programs.neovim.enable = true;

  # Enable git configuration
  programs.git = {
    enable = true;
  };

  # Configure your shell (e.g., bash, zsh)
  programs.bash = {
    completion.enable = true;
  };

}