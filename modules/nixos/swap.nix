{
  flake.modules.nixos.swap = {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024; # 16 GiB, в мебібайтах
      }
    ];
  };
}
