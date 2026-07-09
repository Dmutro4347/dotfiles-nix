{ config, ... }:
let
  inherit (config.flake.modules)
    homeManager
    nixos
    generic
    ;

  commonImports = [
    generic.primaryUser
    generic.primaryUserHome
  ];
in
{
  flake.modules.nixos.base = {
    system.stateVersion = "26.05";
    imports = commonImports ++ [
      nixos.boot
      nixos.locale
      nixos.network
      nixos.timezone
      nixos.nix
      nixos.nix-ld
      nixos.kernel
      nixos.users
    ];
    home-manager.sharedModules = [ homeManager.base ];
  };

  flake.modules.homeManager.base = {
    imports = [
      homeManager.ranger
      homeManager.zsh
      homeManager.tmux

      #     homeManager.atuin
      #     homeManager.bat
      #     homeManager.btop
      #     homeManager.catppuccin
      #     homeManager.claudeCode
      #     homeManager.fastfetch
      #     homeManager.fonts
      #     homeManager.fzf
      #     homeManager.git
      #     homeManager.go
      #     homeManager.gpg
      #     homeManager.granted
      #     homeManager.k8s
      #     homeManager.mcp
      #     homeManager.neovim
      #     homeManager.opencode
      #     homeManager.packages
      #     homeManager.scripts
      #     homeManager.starship
      #     homeManager.tmux
      #     homeManager.zsh
    ];
  };
}
