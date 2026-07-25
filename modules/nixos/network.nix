{
  flake.modules.nixos.network = {
    networking.networkmanager.enable = true;
    # networking.networkmanager.wifi.powersave = true;
  };
}
