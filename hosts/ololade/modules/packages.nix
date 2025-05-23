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
    
    jq
    libsecret
    home-manager
    curl htop
    pciutils usbutils
    killall
    catppuccin-gtk catppuccin-papirus-folders catppuccin-cursors
    qt6ct
    vim xfce.mousepad
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
    alacritty
    gammastep
    imv
    dunst
    flatpak
    kitty
    kdePackages.qt6ct kdePackages.qtstyleplugin-kvantum kdePackages.breeze-gtk
    kdePackages.qtvirtualkeyboard kdePackages.breeze-icons kdePackages.okular
    kdePackages.qtsvg kdePackages.qtmultimedia
    cliphist
    wlogout
    wl-clipboard
    typescript
    vscode
    google-chrome
    hyprsunset
    wireplumber   # PipeWire session manager (essential)
    pavucontrol   # GUI for audio management
    pamixer       # CLI volume control
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    swww
    networkmanager
    networkmanagerapplet   # GUI applet (for systems with a panel/tray)
    bluez
    blueman
    libimobiledevice
    ifuse
    github-desktop
    upower
    tlp
    temurin-bin
    ];

}
