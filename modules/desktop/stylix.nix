{
  flake.modules.homeManager.stylix =
    {
      pkgs,
      inputs,
      lib,
      ...
    }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      home.packages = with pkgs; [
        dejavu_fonts
        jetbrains-mono
        noto-fonts
        noto-fonts-lgc-plus
        texlivePackages.hebrew-fonts
        # noto-fonts-emoji
        font-awesome
        powerline-fonts
        powerline-symbols
        nerd-fonts.jetbrains-mono
      ];
      home.pointerCursor.enable = true;
      stylix.enableReleaseChecks = false;
      stylix = {
        enable = true;
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
        targets = {
          neovim.enable = false;
          tmux.enable = true;
          noctalia-shell.enable = true;
          yazi.enable = true;
        };

        cursor = {
          name = "DMZ-Black";
          size = 24;
          package = pkgs.vanilla-dmz;
        };
        fonts = {
          emoji = {
            name = "Noto Color Emoji";
            package = pkgs.noto-fonts-color-emoji;
          };
          monospace = {
            name = "JetBrains Mono";
            package = pkgs.jetbrains-mono;
          };
          sansSerif = {
            name = "Noto Sans";
            package = pkgs.noto-fonts;
          };
          serif = {
            name = "Noto Serif";
            package = pkgs.noto-fonts;
          };

          sizes = {
            terminal = 11;
            applications = 11;
          };
        };

        icons = {
          enable = true;
          package = pkgs.papirus-icon-theme;
          dark = "Papirus-Dark";
          light = "Papirus-Light";
        };

        #   image = pkgs.fetchurl {
        #     url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/raw/branch/master/png/gruvbox-dark-rainbow.png";
        #     sha256 = "036gqhbf6s5ddgvfbgn6iqbzgizssyf7820m5815b2gd748jw8zc";
        #   };
      };
      specialisation = {
        light.configuration = {
          stylix.polarity = lib.mkForce "light";
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";
        };
        dark.configuration = {
          stylix.polarity = lib.mkForce "dark";
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
        };
      };
    };
}
