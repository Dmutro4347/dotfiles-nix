{ inputs, ... }:
{
  flake.modules.homeManager.yazi = { pkgs, ... }: {
    programs.yazi = {
      enable = true;
      # enableFishIntegration = true;

      # settings = {
      #   mgr = {
      #     # ratio = [
      #     #   1
      #     #   3
      #     #   4
      #     # ];
      #     sort_by = "natural";
      #     sort_dir_first = true;
      #     # linemode = "size";
      #     show_hidden = false;
      #   };
      #   preview = {
      #     max_width = 1200;
      #     max_height = 1200;
      #   };
      # };
      #
      # keymap.mgr.prepend_keymap = [
      #   {
      #     on = "e";
      #     run = "shell '$EDITOR \"$@\"' --block --confirm";
      #     desc = "Edit file";
      #   }
      #   {
      #     on = [
      #       "e"
      #       "c"
      #     ];
      #     run = "plugin compress";
      #     desc = "Compress selection";
      #   }
      #   {
      #     on = [
      #       "e"
      #       "x"
      #     ];
      #     run = "extract";
      #     desc = "Extract archive";
      #   }
      #   {
      #     on = "b";
      #     run = "plugin bookmarks --args=fzf_jump";
      #     desc = "Fuzzy jump to bookmark";
      #   }
      #   {
      #     on = [
      #       "u"
      #       "m"
      #     ];
      #     run = "shell 'udisksctl mount -b \"$(lsblk -rpo NAME,MOUNTPOINT | awk \"\\$2==\\\"\\\"{print \\$1}\" | fzf)\"' --block";
      #     desc = "Mount USB drive";
      #   }
      # ];
      #
      # plugins = {
      #   compress = pkgs.fetchFromGitHub {
      #     owner = "boydaihungst";
      #     repo = "compress.yazi";
      #     rev = "main"; # зафіксуй rev
      #     hash = "";
      #   };
      #   bookmarks =
      #     pkgs.fetchFromGitHub {
      #       owner = "yazi-rs";
      #       repo = "plugins";
      #       rev = "main"; # зафіксуй rev
      #       hash = "";
      #     }
      #     + "/bookmarks";
      # };

      # initLua = ''
      #   require("bookmarks"):setup()
      # '';
      #
    };
  };
}
