{ inputs, config, ... }:
let
  inherit (config.flake.modules) nixos homwManager;
in
{
  configurations.nixos.thinkpad.module = {
    imports = [
      ./_hardware-configuration.nix
      nixos.base
      # Hardware
      nixos.audio
      nixos.battery
      nixos.bluetooth
      nixos.touchpad
      # Services
      nixos.autoupdate
      nixos.docker
      nixos.gc
      nixos.libvirt
      nixos.openssh
      nixos.greetd
      nixos.hyprland

      homeManager.stylix
      homeManager.kitty
      homeManager.dunkshell
      homeManager.hyprland
    ];
    networking.hostName = "thinkpad";
    system.stateVersion = "26.05";
  };
}
