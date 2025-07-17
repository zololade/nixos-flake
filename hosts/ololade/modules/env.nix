{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1"; # just in case of cursor bugs
    XDG_SESSION_TYPE = "wayland";
    LIBVA_DRIVER_NAME = "iHD";
  };

  environment.variables = {
    EDITOR = "nvim";
  };

}
