{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, astal, ags, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.ololade = pkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        astal = inputs.astal;
        ags = inputs.ags;
      };
      modules = [
        ./hosts/ololade/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        nodejs
        ags.packages.${system}.default
      ];
    };

    # This is the important bit: your shell bundle package
    packages.${system}.astal-shell = pkgs.stdenvNoCC.mkDerivation rec {
      name = "astal-shell";
      src = ./.;

      nativeBuildInputs = [
        ags.packages.${system}.default
        pkgs.wrapGAppsHook
        pkgs.gobject-introspection
      ];

      buildInputs = with astal.packages.${system}; [
        astal3
        io
        # Add other Astal libraries as needed
      ];

      installPhase = ''
        mkdir -p $out/bin
        ags bundle app.ts $out/bin/${name}
      '';
    };

    # Optionally set the default package to the shell
    packages.${system}.default = self.packages.${system}.astal-shell;
  };
}
