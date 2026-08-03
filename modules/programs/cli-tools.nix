{ inputs, config, ... }:
let

  inherit (config.flake.modules)
    homeManager
    ;
in
{
  flake.modules.homeManager.cli-tools =
    { pkgs, ... }:
    {
      imports = [
        homeManager.tmux
        homeManager.yazi
      ];
      home.packages = with pkgs; [
        pinentry-curses
        bc
        gnupg
        htop
        jq
        killall
        microfetch
        onefetch
        pass
        unzip
        wget
        ripgrep
        yazi
        tmux
        tmuxinator
        tree
        autojump
        fd
        # neovim

      ];

    };

}
