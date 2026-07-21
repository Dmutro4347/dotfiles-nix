{
  flake.modules.nixos.monitor =
    { config, pkgs, ... }:
    {
      hardware.i2c.enable = true;
      environment.systemPackages = with pkgs; [
        ddcutil
      ];
    };
}
