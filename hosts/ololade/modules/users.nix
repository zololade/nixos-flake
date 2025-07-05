{ config, pkgs, ... }:

{

  virtualisation.docker.enable = true;

  users.users.ololade = {
    isNormalUser = true;
    description = "Ololade";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
      vlc
      libreoffice
    ];
  };

}
