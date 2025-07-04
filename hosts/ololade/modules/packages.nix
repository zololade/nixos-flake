{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    home-manager
    lazygit
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
    nwg-look
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
    swww
    libimobiledevice
    ifuse
    github-desktop
    upower
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

    programs.java = {
      enable = true;
      package = pkgs.jdk; # This installs the latest LTS version of OpenJDK
    };
    
   
    programs.waybar.enable = true;

    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [ 
      thunar-archive-plugin 
      thunar-volman 
      thunar-dropbox-plugin
      thunar-media-tags-plugin
      thunar-vcs-plugin
    ];

    programs.fish = {
      enable = true;
    };
   

    programs.starship = {
      enable = true;
    };


    fonts.packages = with pkgs; [
      corefonts
      fira-code
    ];

}
