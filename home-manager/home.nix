# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:

let
  pk = inputs.ags.packages.x86_64-linux;
  agsPkg = inputs.ags.packages.x86_64-linux.default;
in {
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
    agsPkg
    pk.io
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
