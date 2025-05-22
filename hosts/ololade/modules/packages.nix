{ config, pkgs, ... }:

let
  customAstronaut = pkgs.stdenv.mkDerivation {
    pname    = "sddm-astronaut-theme-custom";
    version  = "1.0.0";

    # ← Use the latest commit SHA from the repo’s commit list:
    src = pkgs.fetchFromGitHub {
      owner   = "Keyitdev";
      repo    = "sddm-astronaut-theme";
      rev     = "bf4d017";       # commit “Update: Added option to enable sddm in setup script.” Apr 14, 2025 :contentReference[oaicite:0]{index=0}
      # You’ll need the matched SHA256 hash below. See note 👇
      sha256  = "1sj9b381gh6xpp336lq1by5qsa54chqcgq37r8daqbp2igp8dh14";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
      cp -r * $out/share/sddm/themes/sddm-astronaut-theme

      # Patch metadata.desktop to pick the variant you want
      sed -i 's|ConfigFile=.*|ConfigFile=Themes/cyberpunk.conf|' \
        $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
    '';

    meta = {
      description = "Custom SDDM Astronaut theme with modified config";
      homepage    = "https://github.com/Keyitdev/sddm-astronaut-theme";
      license     = pkgs.lib.licenses.gpl3;
    };
  };
in{
  nixpkgs.config.allowUnfree = true;

  
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
    #sddm-astronaut
    customAstronaut
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
    kdePackages.qtvirtualkeyboard kdePackages.breeze-icons kdePackages.okular
    kdePackages.qtsvg kdePackages.qtmultimedia
    cliphist
    wlogout
    wl-clipboard
    #btrfs-assistant
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
    tlp
    ];
}
