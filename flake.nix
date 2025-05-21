# ~/nixos-flake/flake.nix
{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; 

  #Add ags as a flake input
     astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
<<<<<<< HEAD
      system = system;
=======
      system = "x86_64-linux"; 
      specialArgs = { inherit inputs; }; 
>>>>>>> parent of b5bdee2 (fix)
      modules = [
        ./hosts/ololade/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };

     devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
       packages = with nixpkgs.legacyPackages.x86_64-linux; [
         git
         nodejs
       ];

     };
  };
}

