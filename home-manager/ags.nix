# ~/nixos-flake/home-manager/ags.nix
{ config, pkgs, ... }:

{
  # Enable AGS as a user service to autostart it with your session
  systemd.user.services.ags = {
    enable = true;
    description = "Aylur's GTK Shell";
    # Command to run AGS. This assumes your AGS configuration is compiled to build/main.js
    # Adjust `build/main.js` if your compiled output path is different (e.g., dist/main.js).
    ExecStart = "${pkgs.ags.packages.${pkgs.system}.default}/bin/ags -c ${config.home.homeDirectory}/.config/ags/build/main.js";
    # WantedBy target based on your Wayland compositor.
    # graphical-session.target is a good general choice.
    # If you use Hyprland, `hyprland-session.target` might be more specific.
    WantedBy = [ "graphical-session.target" ];
    # Add dependencies if AGS needs to wait for them to be ready
    # Example for PipeWire:
    # After = [ "pipewire.service" ];
  };

  # Copy your existing AGS configuration files into your home directory
  # This makes sure Home Manager manages your AGS config.
  # The `source` path is your current, *local* AGS config directory.
  home.file.".config/ags" = {
    source = /home/ololade/.config/ags; # <--- This is the correct path based on your `ls` output!
    recursive = true;
  };

  # You might also want to ensure the build process happens.
  # This isn't strictly part of the `ags.nix` for *running* it,
  # but you'll need to run your build script (e.g., `npm run build`)
  # inside `~/.config/ags` whenever you change your source files.
  # You could automate this with a pre-build hook if you're advanced,
  # but for now, ensure the `build` directory exists and has `main.js`.
}
