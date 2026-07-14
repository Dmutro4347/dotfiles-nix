{
  flake.modules.nixos.kdeconnect = {
    # Порти для discovery/з'єднання — без цього телефон і ноутбук
    # просто не побачать одне одного, навіть з локальної мережі.
    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };

  flake.modules.homeManager.kdeconnect =
    { pkgs, ... }:
    {
      services.kdeconnect = {
        enable = true;
        package = pkgs.kdePackages.kdeconnect-kde; # сучасна Qt6-версія
        indicator = true; # іконка в треї
      };
    };
}
