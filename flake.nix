{
  description = "My NixOS configuration";

  inputs = {
<<<<<<< HEAD
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # align with home-manager
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
=======
    # Nixpkgs provides the core NixOS system and packages.
    # We'll pin to the 'nixos-unstable' branch for the latest features,
    # as your current system.stateVersion implies you're on a recent channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Use nixos-24.11 if you want to stick to stable releases
    # You can add home-manager here if you plan to use it (highly recommended for user configs)
    # For now, we'll keep it simple if you're not explicitly using it yet.
    # If you are, uncomment the following and update the path to its modules in your system config:
    # home-manager.url = "github:nix-community/home-manager/release-24.11"; # Or release-24.05, master, etc.
    # home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Ensure home-manager uses the same nixpkgs version
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Define your NixOS configurations
    nixosConfigurations.ololade = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Adjust if your system architecture is different (e.g., aarch64-linux)
      specialArgs = { inherit inputs; }; # Pass inputs to your modules
      modules = [
        # Import your configuration from the 'modules' subdirectory
        # This will be created in Step 3
        ./hosts/ololade/configuration.nix
        # If you added home-manager above, uncomment this and point to its module:
        # home-manager.nixosModules.home-manager
      ];
    };

    # You can add other outputs here, like devShells for development environments:
    # devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
    #   packages = with nixpkgs.legacyPackages.x86_64-linux; [
    #     git
    #     nodejs
    #   ];
    # };
>>>>>>> parent of 3afc580 (added ags)
  };
}
