{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; 
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; 
    
    #ags.url = "github:aylur/ags"; 
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; 
      specialArgs = { inherit inputs; }; 
      modules = [
        ./hosts/ololade/configuration.nix
      ];
    };



    homeConfigurations.ololade = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { 
        system = "x86_64-linux"; 
        config.allowUnfree = true;
      };
      extraSpecialArgs = { inherit inputs self; };
      modules = [
       ./home-manager/home.nix
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
