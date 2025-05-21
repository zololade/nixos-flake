{ config, pkgs, ... }:

{
  home.username = "ololade";
  home.homeDirectory = "/home/ololade";
  home.stateVersion = "23.11"; # or your actual nixos-version

  #systemd.user.services.ags = {
   # enable = true;
   # description = "Aylur's GTK Shell";
   # ExecStart = "${pkgs.ags.packages.${pkgs.system}.default}/bin/ags -c ${config.home.homeDirectory}/.config/ags/build/main.js";
   # WantedBy = [ "graphical-session.target" ];
  #};

  #home.file.".config/ags" = {
   # source = /home/ololade/.config/ags;
   # recursive = true;
  #};
}
