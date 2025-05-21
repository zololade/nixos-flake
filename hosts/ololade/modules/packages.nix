{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  
  environment.systemPackages = with pkgs; [
    jq
    libsecret
    gnome-keyring
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
    #dev tools 
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
    kdePackages.breeze-icons kdePackages.okular
    cliphist
    wlogout
    wl-clipboard
    btrfs-assistant
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
    lxqt.lxqt-policykit
    swww
    networkmanager
    networkmanagerapplet   # GUI applet (for systems with a panel/tray)
    bluez
    blueman
    libimobiledevice
    usbmuxd
    # ipheth-utils
    ifuse
    github-desktop
    upower
    ];
}
