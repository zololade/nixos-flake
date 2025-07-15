# ~/nixos-flake/hosts/ololade/home.nix
{ config, pkgs, inputs, ... }:
 
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
    # Add any other packages you want installed for your user
    testdisk
    libadwaita
    adwaita-icon-theme
    material-design-icons
    protonvpn-gui
  ];

  #wallpaper
  systemd.user.services.coolwall = {
    Unit = {
      Description = "CoolWall Script";
    };

    Service = {
      ExecStart = "/home/ololade/.config/coolwall.py";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  #git
  programs.git = {
    userName = "ololade";
    userEmail = "73138104+zololade@users.noreply.github.com";
  };

  #code setup
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
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
