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
  configurations.nixos.thinkpad.module = {
    imports = [
      ./_hardware-configuration.nix
      nixos.base
      # Hardware
      nixos.battery
      nixos.bluetooth
      nixos.touchpad
      # Services
      nixos.libvirt
      nixos.openssh
      nixos.niri
      # nixos.spicetify
    ];
    primaryUser = "arfors";
    system.stateVersion = "26.05";
  };
}
