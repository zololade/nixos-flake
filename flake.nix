{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # align with home-manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";

    astal.url = "github:Aylur/astal";
    astal.inputs.nixpkgs.follows = "nixpkgs";

    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
    ags.inputs.astal.follows = "astal";
  };

  outputs = { self, nixpkgs, home-manager, ags, astal, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    astalPkgs = import astal {
      inherit system;
    };

    agsPkgs = import ags {
      inherit system;
    };
  in
  {
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/ololade/configuration.nix

        (import "${pkgs.modulesPath}/misc/nixpkgs/read-only.nix" {
          nixpkgs.pkgs = pkgs;
        })

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.ololade = {
            imports = [
              ./home-manager/ags.nix
            ];

            home.packages = with pkgs; [
              agsPkgs.packages.${system}.default
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
