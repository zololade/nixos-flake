{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    home-manager
    lazygit
    alsa-utils
    libva-utils
    vulkan-tools
    ffmpeg
    mpv
    gnumake
    fd
    ripgrep		
    grim
    rofi-wayland    
    xdg-utils       
    jq
    libsecret
    curl
    pciutils usbutils
    killall
    catppuccin-gtk catppuccin-papirus-folders catppuccin-cursors
    wget
    eww
    btop
    fuzzel
    fastfetch
    fzf
    ranger
    zip
    brightnessctl
    nodejs 
    python3 
    gcc 
    nmap
    gammastep
    imv
    dunst
    kitty
    kdePackages.qt6ct kdePackages.qtstyleplugin-kvantum kdePackages.breeze-gtk
    kdePackages.breeze-icons kdePackages.okular
    nwg-look
    cliphist
    wlogout
    wl-clipboard
    typescript
    google-chrome
    hyprsunset
    pavucontrol   # GUI for audio management
    pamixer       # CLI volume control
    swww
    libimobiledevice
    ifuse
    github-desktop
    unzip           # for .zip
    p7zip           # for .7z, .7zip, .rar, etc.
    unrar           # for .rar (optional, but useful)
    xz              # for .xz
    gzip            # for .gz
    bzip2           # for .bz2
    zstd            # for .zst
    file-roller
    inkscape-with-extensions
    lm_sensors
    ];

    fonts.packages = with pkgs; [
      corefonts
      fira-code
    ];

}
