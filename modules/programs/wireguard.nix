{
  flake.modules.nixos.wireguard =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.wireguard-tools ];

      networking.wg-quick.interfaces.wg0 = {
        address = [ "10.0.0.3/24" ];
        privateKeyFile = "/etc/wireguard/private.key";

        peers = [
          {
            publicKeyFile = "/etc/wireguard/public.key";
            endpoint = "194.44.112.76:51820";
            allowedIPs = [ "10.0.0.0/24" ];
            persistentKeepalive = 25;
          }
        ];
      };
    };
}
