# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:

{

 # add the home manager module
  #imports = [ inputs.ags.homeManagerModules.default ];

  #programs.ags = {
  #  enable = true;

    # symlink to ~/.config/ags
   # configDir = ../ags;

    # additional packages to add to gjs's runtime
   # extraPackages = with pkgs; [
    #  inputs.ags.packages.${pkgs.system}.battery
    #  fzf
   # ];
  #};









  # Define your user's name
  home.username = "ololade";
  home.homeDirectory = "/home/ololade"; # Make sure this matches your actual home directory

  # Home Manager needs to know where to install its packages
  home.stateVersion = "24.11"; # Set this to your NixOS stateVersion or a Home Manager release (e.g., "24.11")


  # Install user packages
  home.packages = with pkgs; [
    firefox
    neovim
    htop
    git
    # Add any other packages you want installed for your user
    gtk4
    libadwaita
    adwaita-icon-theme
    material-design-icons
  ];

  # Configure your shell (e.g., bash, zsh)
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFile = "${config.xdg.dataHome}/bash_history";
    initExtra = ''
      # Your custom bash configurations here
      alias ll="ls -lh"
    '';
  };

  # Enable git configuration
  programs.git = {
    enable = true;
    userName = "ololade";
    userEmail = "73138104+zololade@users.noreply.github.com"; # IMPORTANT: Change this
  };

}
