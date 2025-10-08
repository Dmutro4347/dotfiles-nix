{ pkgs, stateVersion, hostname, ... }:

{
  imports =
    [ ./hardware-configuration.nix ./local-packages.nix ../../modules/nixos ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

