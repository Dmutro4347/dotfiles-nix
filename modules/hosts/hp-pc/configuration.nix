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
      nixos.bluetooth
      # nixos.nvidia
      # Services
      nixos.libvirt
      nixos.openssh
      nixos.niri
    ];
    primaryUser = "arfors";
    system.stateVersion = "26.05";
  };
}
