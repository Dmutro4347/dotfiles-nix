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
      nixos.docker
      nixos.touchpad
      nixos.fingerprint
      # Services
      nixos.libvirt
      nixos.openssh
      # nixos.vm-curator

      # wm
      nixos.niri

    ];

    primaryUser = "arfors";
    system.stateVersion = "26.05";
  };
}
