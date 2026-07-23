{
  flake.modules.nixos.battery = {
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    services.udev.extraRules = ''
      SUBSYSTEM=="power_supply", KERNEL=="BAT0", ATTR{charge_control_end_threshold}="80"
    '';
  };
}
