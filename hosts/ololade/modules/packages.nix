{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
        flavor = "mocha";
        font  = "Noto Sans";
        fontSize = "9";
        #background = "${./wallpaper.png}";
        loginBackground = true;
      }
    )

    grim
    rofi-wayland    
    xdg-utils       
    jq
    libsecret
    home-manager
    curl htop
    pciutils usbutils
    killall
    catppuccin-gtk catppuccin-papirus-folders catppuccin-cursors
    neovim
    wget
    eww
    btop
    fuzzel
    fastfetch
    fzf
    ranger
    unzip
    zip
    gnome-tweaks
    brightnessctl
    nodejs 
    git
    python3 
    gcc 
    nmap
    gammastep
    imv
    dunst
    flatpak
    kitty
    kdePackages.qt6ct kdePackages.qtstyleplugin-kvantum kdePackages.breeze-gtk
    kdePackages.breeze-icons kdePackages.okular
    cliphist
    wlogout
    wl-clipboard
    typescript
    vscode-fhs
    google-chrome
    hyprsunset
    wireplumber   # PipeWire session manager (essential)
    pavucontrol   # GUI for audio management
    pamixer       # CLI volume control
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    swww
    networkmanagerapplet   # GUI applet (for systems with a panel/tray)
    bluez
    kdePackages.bluez-qt
    libimobiledevice
    ifuse
    github-desktop
    upower
    tlp
    ];

    programs.java = {
      enable = true;
      package = pkgs.jdk; # This installs the latest LTS version of OpenJDK
    };
    
    
    programs.thunar.enable = true;

    programs.fish = {
      enable = true;
    };
   

    programs.starship = {
      enable = true;
    };


}
