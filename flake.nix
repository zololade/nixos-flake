# ~/nixos-flake/flake.nix
{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Use nixos-24.11 if you want to stick to stable releases
    home-manager.url = "github:nix-community/home-manager/release-24.11"; # Or release-24.05, master, etc.
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensure home-manager uses the same nixpkgs version
    
    # Astal: The core libraries for GTK-based shells
    astal.url = "github:Aylur/astal";
    astal.inputs.nixpkgs.follows = "nixpkgs"; # Ensure Astal uses your main nixpkgs

    # AGS (Aylur's GTK Shell): The framework for building custom shells using Astal
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs"; # Ensure AGS uses your main nixpkgs
    ags.inputs.astal.follows = "astal"; 

  };

  outputs = { self, nixpkgs, home-manager, ags, astal, ... }@inputs:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # optional
  };
in {
  nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
    system = system;
    specialArgs = {
      inherit inputs pkgs;
    };
    modules = [
      ./hosts/ololade/configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.ololade = {
          imports = [
            ./home-manager/ags.nix
          ];

          home.packages = with pkgs; [
            ags.packages.${system}.default
            gjs
            gtk4
            gtk-layer-shell
            networkmanager
            upower
            bluez
            brightnessctl
            wl-clipboard
            wireplumber
            playerctl
          ];
        };
      }
    ];
  };
};

}
