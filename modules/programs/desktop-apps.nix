{ inputs, config, ... }:
let

  inherit (config.flake.modules)
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
        homeManager.spicetify
        homeManager.kitty
      ];
      home.packages = with pkgs; [
        zoom-us
        hunspell
        hunspellDicts.uk_UA
        qbittorrent
        kitty
        obsidian
        telegram-desktop
        virt-manager
        firefox
        lmstudio
        jetbrains.pycharm
        discord
        dbeaver-bin
        antigravity-ide
        teams-for-linux
        bitwarden-desktop
        cisco-packet-tracer_9
        anki
        libreoffice
      ];

    };
}
