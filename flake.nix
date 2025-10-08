{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nix-ld.url = "github:Mic92/nix-ld";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minegrub-theme = {
      url = "github:Lxtharia/minegrub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, minegrub-theme, ...
    }@inputs:
    let
      system = "x86_64-linux";
      homeStateVersion = "25.05";
      unstable = import nixpkgs-unstable { inherit system; };
      user = "arfors";
      hosts = [{
        hostname = "nixos";
        stateVersion = "25.05";
      }];

      makeSystem = { hostname, stateVersion }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs stateVersion hostname user; };

          modules = [
            minegrub-theme.nixosModules.default
            ./hosts/${hostname}/configuration.nix
          ];
        };
    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" =
            makeSystem { inherit (host) hostname stateVersion; };
        }) { } hosts;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];

        extraSpecialArgs = { inherit unstable inputs homeStateVersion user; };
      };
    };
}
