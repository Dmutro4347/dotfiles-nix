{ inputs, ... }:
let

  inherit (config.flake.modules)
    nixos
    homeManager
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
        nixos.spicetify
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

      #

    };
}
