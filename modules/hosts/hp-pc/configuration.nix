{
  inputs,
  config,
  system,
  ...
}:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  configurations.nixos.hp-pc.module = {
    imports = [
      ./_hardware-configuration.nix
      nixos.base
      # Hardware
      # nixos.bluetooth
      nixos.monitor
      nixos.nvidia
      # Services
      nixos.libvirt
      nixos.openssh
      nixos.niri
      nixos.docker
      # homeManager.waync
    ];
    primaryUser = "arfors";
    system.stateVersion = "26.05";
  };
}
