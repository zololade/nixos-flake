{ config, lib, pkgs, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
  xdg.terminal-exec.enable = true;
  xdg.mime.enable
}