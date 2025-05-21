# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:

{

 # --- IMPORT THE AGS HOME MANAGER MODULE HERE ---
  imports = [
    inputs.ags.homeManagerModules.default # This line imports the ags module
  ];

  # Enable and configure ags
  programs.ags = {
    enable = true;

    # Point to your ags configuration directory.
    # BEST PRACTICE: Keep your ags config files (JS, CSS, etc.)
    # within your dotfiles and let Home Manager symlink them.
    # Example: If your ags config is in ~/nixos-flake/ags-config/
    # This path is relative to the location of THIS home.nix file.
    configDir = ../ags-config; # Assuming 'ags-config' is a directory next to 'home' directory

    # Add any extra packages that your ags configuration might depend on.
    # ags often needs external tools for its modules (network, audio, bluetooth, etc.)
    extraPackages = with pkgs; [
      gjs # JavaScript engine for GTK, essential for ags
      gtk3 # For GTK3 applications/widgets that ags might use
      gtk4 # For GTK4 applications/widgets that ags might use
      gtk-layer-shell # Crucial for Wayland positioning (if not pulled by gtk4)
      networkmanager # If you have a network module
      upower # For battery status
      gnome.gnome-bluetooth # For Bluetooth module
      pamixer # For audio control
      brightnessctl # For screen brightness control
      swww # For wallpaper management (if used in ags)
      grimblast # For screenshots (if used in ags)
      hyprpicker # For color picking (if used in ags)
      # ... add any other tools your ags config relies on that are not already
      # part of your system environment or ags's default dependencies.
    ];
  };

  # Example: If you are using Hyprland, you might autostart ags here
  # programs.hyprland = {
  #   enable = true;
  #   extraConfig = ''
  #     exec-once = ags
  #   '';
  # };









  # Define your user's name
  home.username = "ololade";
  home.homeDirectory = "/home/ololade"; # Make sure this matches your actual home directory

  # Home Manager needs to know where to install its packages
  home.stateVersion = "24.11"; # Set this to your NixOS stateVersion or a Home Manager release (e.g., "24.11")

  # Link some dotfiles
  #home.file.".config/my-app/config.ini".source = ./files/my-app-config.ini; # Example: path to a local file

  # Install user packages
  home.packages = with pkgs; [
    firefox
    neovim
    htop
    git
    # Add any other packages you want installed for your user
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

  # You can also enable services that run in your user session
  # services.gpg-agent.enable = true;
  # services.syncthing.enable = true;

  # Other Home Manager options can go here, e.g., programs.neovim, programs.firefox, etc.
}
