{ config, pkgs, ... }:

{
  virtualisation.incus = { enable = true; };

  # Incus потребує networkd
  networking.useNetworkd = true;
  networking.useDHCP = false;
  networking.nftables.enable = true;
  # Щоб bridge працював
  networking.firewall.trustedInterfaces = [ "incusbr0" ];
}

