{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; 
    
    ags.url = "github:aylur/ags"; 
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; 
      specialArgs = { inherit inputs; }; 
      modules = [
        ./hosts/ololade/configuration.nix
        home-manager.nixosModules.home-manager
      ];
    };



     homeConfigurations.ololade = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      # pass inputs as specialArgs
      extraSpecialArgs = { inherit inputs; };

      # import your home.nix
      modules = [ ./home-manager/home.nix ];
    };


     devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
       packages = with nixpkgs.legacyPackages.x86_64-linux; [
         git
         nodejs
       ];

     };
  };
}
