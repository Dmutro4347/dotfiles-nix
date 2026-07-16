{ config, pkgs, inputs, lib, ... }:

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
}

