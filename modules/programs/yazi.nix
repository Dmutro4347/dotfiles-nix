{
  inputs,
  config,
  lib,
  ...
}:
{
  flake.modules.homeManager.yazi =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;

        settings = {
          mgr = {
            ratio = [
              1
              3
              4
            ];
            sort_by = "natural";
            sort_dir_first = true;
            linemode = "size";
            show_hidden = false;
          };
          preview = {
            max_width = 1200;
            max_height = 1200;
          };
        };

        keymap.mgr.prepend_keymap = [
          {
            on = [
              "e"
              "c"
            ];
            run = "plugin compress";
            desc = "Compress selection";
          }
          {
            on = [
              "u"
              "m"
            ];
            run = "shell 'udisksctl mount -b \"$(lsblk -rpo NAME,MOUNTPOINT | awk \"\\$2==\\\"\\\"{print \\$1}\" | fzf)\"' --block";
            desc = "Mount USB drive";
          }
        ];

        plugins = {
          compress = pkgs.fetchFromGitHub {
            owner = "boydaihungst";
            repo = "compress.yazi";
            rev = "main"; # зафіксуй rev
            hash = "sha256-/3a1T1aGRKmhkRROFVa12w2Kxn766A4C2sLvFZlnKAI=";
          };
          #   bookmarks =
          #     pkgs.fetchFromGitHub {
          #       owner = "yazi-rs";
          #       repo = "plugins";
          #       rev = "main"; # зафіксуй rev
          #       hash = "";
          #     }
          #     + "/bookmarks";
        };
        #   theme.indicator = with config.lib.stylix.colors.withHashtag; {
        #     current = lib.mkForce {
        #       fg = base00;
        #       bg = base0D;
        #     };
        #   };
      };
    };
}
