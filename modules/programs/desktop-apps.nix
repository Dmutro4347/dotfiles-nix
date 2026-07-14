{ inputs, ... }: {
  flake.modules.homeManager.desktop-apps =
    {
      config,
      pkgs,
      inputs,
      lib,
      ...
    }:
    {
      home.packages = with pkgs; [
        qbittorrent
        kitty
        obsidian
        telegram-desktop
        virt-manager
        firefox
        lmstudio
        jetbrains.pycharm
        spotify
      ];

      #
      programs.kitty = {
        enable = true;

        settings = {
          # background_opacity = lib.mkForce 0.87;
          hide_window_decorations = "yes";
          window_margin_width = lib.mkForce 15;

        };
      };
    };
}
