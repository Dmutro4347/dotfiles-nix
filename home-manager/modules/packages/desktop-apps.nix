{ config, pkgs, inputs, lib, ... }:
{
home.packages = with pkgs; [
    qbittorrent
    kitty
    obsidian
    telegram-desktop
    virt-manager
    firefox
    lmstudio
 ];

let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    # Home Manager модуль від Spicetify
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;

    # theme = lib.mkForce spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [ adblockify shuffle ];
  };
};
}
