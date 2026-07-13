{
  flake.modules.nixos.xdg =
    { pkgs, ... }:

    {
      xdg.portal = {
        enable = true;

        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
        config.niri.default = [ "gtk" ];
        config.common.default = "*";
      };
    };
}
