{ config, ... }:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.modules.nixos.compositorCommon = {
    imports = [
      nixos.audio
      nixos.autoupdate
      nixos.xdg
      nixos.dankshell
    ];

    security.polkit.enable = true;
  };

  flake.modules.homeManager.compositorCommon = {
    imports = [
      homeManager.stylix
      homeManager.desktop-apps
      homeManager.wm-tools
      homeManager.gpg-agent
    ];

  };
}
