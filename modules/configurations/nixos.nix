{
  inputs,
  lib,
  config,
  ...
}:
{
  options.configurations.nixos = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options.module = lib.mkOption {
          type = lib.types.deferredModule;
          default = { };
          description = "NixOS module for this configuration";
        };
      }
    );
    default = { };
    description = "NixOS system configurations";
  };

  config.flake = {
    nixosConfigurations = lib.mapAttrs (
      name: cfg:
      inputs.nixpkgs.lib.nixosSystem {
        # 1. Прокидаємо inputs для NixOS модулів
        specialArgs = {
          inherit inputs;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager

          # Використовуємо функцію, щоб безпечно дістати pkgs.system
          ({ pkgs, ... }: {
            networking.hostName = lib.mkDefault name;

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              # 2. Прокидаємо inputs та мапимо nixpkgs-unstable в "unstable" для Home Manager
              extraSpecialArgs = {
                inherit inputs;
                # Беремо пакети з твого інпуту nixpkgs-unstable, але називаємо змінну unstable:
              };
            };
          })
          cfg.module
        ];
      }
    ) config.configurations.nixos;

    checks = lib.foldlAttrs (
      acc: name: _:
      let
        nixos = config.flake.nixosConfigurations.${name};
        inherit (nixos.config.nixpkgs.hostPlatform) system;
      in
      lib.recursiveUpdate acc {
        ${system}."nixos-${name}" = nixos.config.system.build.toplevel;
      }
    ) { } config.configurations.nixos;
  };
}
