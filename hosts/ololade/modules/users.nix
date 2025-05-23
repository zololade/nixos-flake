{ config, pkgs, ... }:

{
  users.users.ololade = {
    isNormalUser = true;
    description = "Ololade";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    # shell = pkgs.bash;
    packages = with pkgs; [
      tree
      kdePackages.dolphin
      vlc
      libreoffice
    ];
  };

}
