{
  flake.module.nixos.asusctl =
    { config, pkgs, ... }:

    {
      services.asusd = {
        enable = true;
        enableUserService = true;
      };

      environment.systemPackages = with pkgs; [
        asusctl
        supergfxctl
      ];
      services.dbus.enable = true;

    };
}
