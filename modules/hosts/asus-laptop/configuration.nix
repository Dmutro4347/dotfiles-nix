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
  configurations.nixos.asus-laptop.module = {
    imports = [
      ./_hardware-configuration.nix
      nixos.base
      # Hardware
      nixos.battery
      nixos.bluetooth
      nixos.touchpad
      # nixos.asusctl
      # Services
      nixos.libvirt
      nixos.openssh
      nixos.niri
    ];
    primaryUser = "arfors";
    system.stateVersion = "26.05";
  };
}
