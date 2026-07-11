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
      nixos.niri
      nixos.nh
      nixos.xdg
      # nixos.gnome

    ];
    home-manager.sharedModules = [
      homeManager.stylix
      homeManager.kitty
      homeManager.noctalia
      homeManager.niri
      # homeManager.hyprland
      homeManager.cli-tools
      homeManager.desktop-apps
      homeManager.dev-tools
      homeManager.git
      homeManager.gpg-agent
      homeManager.nvchad
      homeManager.wm-tools
      # homeManager.gnome

    ];
    primaryUser = "arfors";
    system.stateVersion = "26.05";
    # specialArgs = {
    #   inherit
    #     inputs
    #     system
    #     ;
    # };
  };
}
