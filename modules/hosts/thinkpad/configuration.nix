{ inputs, config, ... }:
let
  inherit (config.flake.modules) nixos;
in
{
  configurations.nixos.thinkpad.module = {
    imports = [
      ./_hardware-configuration.nix
      nixos.base
    ];
    networking.hostName = "thinkpad";
    system.stateVersion = "25.06";
  };
}
