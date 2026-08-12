{ config, ... }:
let
  inherit (config.flake.modules)
    homeManager
    nixos
    generic
    ;

  commonImports = [
    generic.primaryUser
    generic.primaryUserHome
    generic.profile
  ];
in
{
  flake.modules.nixos.base = {
    system.stateVersion = "26.05";
    imports = commonImports ++ [
      nixos.boot
      nixos.locale
      nixos.network
      nixos.timezone
      nixos.nix
      nixos.nix-ld
      nixos.kernel
      nixos.env
      nixos.gc
      nixos.nh
      nixos.users
      nixos.swap
      nixos.nvchad
      nixos.udisks

    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      generic.profile
      homeManager.fish
      homeManager.nvchad
      homeManager.cli-tools
      homeManager.dev-tools
      homeManager.git
    ];
  };
}
