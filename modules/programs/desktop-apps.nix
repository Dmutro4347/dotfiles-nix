{ inputs, ... }: {
  flake.modules.homeManager.desktop-apps =
    {
      config,
      pkgs,
      inputs,
      lib,
      ...
    }:
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      home.packages = with pkgs; [
        qbittorrent
        kitty
        obsidian
        telegram-desktop
        virt-manager
        firefox
        lmstudio
        # spotify
      ];

      imports = [
        #     # Home Manager модуль від Spicetify
        inputs.spicetify-nix.homeManagerModules.spicetify
        # inputs.spicetify-nix.nixosModules.default
      ];

      programs.spicetify = {
        enable = true;

        # ОБОВ'ЯЗКОВО: вказуємо робочу тему, щоб інтерфейс міг відмалюватися
        # theme = spicePkgs.themes.catppuccin;

        # ОПЦІОНАЛЬНО: задаємо темну колірну схему для цієї теми
        # colorScheme = "mocha";

        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          shuffle
        ];
      };
    };
}
