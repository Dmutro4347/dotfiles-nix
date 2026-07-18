{ inputs, config, ... }:
let

  inherit (config.flake.modules)
    homeManager
    nixos
    ;
in
{
  flake.modules.homeManager.desktop-apps =
    {
      config,
      pkgs,
      inputs,
      lib,
      ...
    }:
    {
      imports = [
        homeManager.spicetify
        homeManager.kitty
      ];
      home.packages = with pkgs; [
        qbittorrent
        kitty
        obsidian
        telegram-desktop
        virt-manager
        firefox
        lmstudio
        jetbrains.pycharm
        discord
      ];

    };
}
