{
  description = "My NixOS configuration with Astal and AGS";
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

    astal = {
     astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, astal, ags, ... }@inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
      system = system;
      system = "x86_64-linux"; 
      specialArgs = { inherit inputs; }; 
      modules = [
        ./hosts/ololade/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        ags.packages.${system}.default
        pkgs.wrapGAppsHook
        pkgs.gobject-introspection
      ];
     devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
       packages = with nixpkgs.legacyPackages.x86_64-linux; [
         git
         nodejs
       ];

      shellHook = ''
        export ASTAL3_LIBRARY_PATH=${astal.packages.${system}.astal3}/lib
      '';
    };
     };
  };
}

