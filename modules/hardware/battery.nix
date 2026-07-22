{
  flake.modules.nixos.battery = {
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    service.tlp = {
      enable = true;
      settings = {
        # Поріг заряду — головне, що тебе цікавить
        START_CHARGE_THRESH_BAT0 = 75;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
  };
}
