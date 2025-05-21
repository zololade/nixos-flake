# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:

let
  pk = inputs.ags.packages.x86_64-linux;
  #agsPkg = inputs.ags.packages.x86_64-linux.default;
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
    pk.agsFull
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

gtk = {
  enable = true;

  theme = {
    name = "catppuccin-mocha-rosewater"; # Use the exact folder name
    package = null; # Since you're using a local theme
  };

  iconTheme = {
    name = "Papirus-Dark"; # or your Catppuccin icon theme name
    package = null;
  };

  cursorTheme = {
    name = "catppuccin-mocha-rosewater-cursors"; # optional
    package = null;
  };
};

home.sessionVariables = {
  GTK_THEME = "catppuccin-mocha-rosewater";
  XDG_CURRENT_DESKTOP = "Hyprland";
  XCURSOR_THEME = "catppuccin-mocha-rosewater-cursors";
  # If you want to be extra clear:
  XDG_DATA_DIRS = "${config.home.homeDirectory}/.local/share:${config.home.homeDirectory}/.icons:${config.home.homeDirectory}/.themes";
};



}
