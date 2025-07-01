# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:

#let
#  pk = inputs.ags.packages.x86_64-linux;
#in 
{
  # Define your user's name
  home.username = "ololade";
  home.homeDirectory = "/home/ololade"; # Make sure this matches your actual home directory

  # Home Manager needs to know where to install its packages
  home.stateVersion = "25.05"; # Set this to your NixOS stateVersion or a Home Manager release (e.g., "24.11")


  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Install user packages
  home.packages = with pkgs; [
    git
    # Add any other packages you want installed for your user
    testdisk
    libadwaita
    adwaita-icon-theme
    #pk.agsFull
    material-design-icons
    protonvpn-gui
  ];

  # Configure your shell (e.g., bash, zsh)
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      # Your custom bash configurations here
      alias ll="ls -lh"
    '';
  };

  #code
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  # Enable git configuration
  programs.git = {
    enable = true;
    userName = "ololade";
    userEmail = "73138104+zololade@users.noreply.github.com"; # IMPORTANT: Change this
  };

  #wallpaper
  systemd.user.services.coolwall = {
    Unit = {
      Description = "CoolWall Script";
      #After = [ "network-online.target" ];
      #Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "/home/ololade/.config/coolwall.py";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  #code
  xdg.desktopEntries.code = {
    name = "Visual Studio Code";
    comment = "Code Editing. Redefined. (with Gnome Libsecret)";
    exec = "${pkgs.vscode}/bin/code --password-store=gnome-libsecret %U";
    icon = "code";
    terminal = false;
    categories = [ "Development" "IDE" ];
  };

}
