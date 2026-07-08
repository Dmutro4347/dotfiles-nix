{
  pkgs,
  stateVersion,
  hostname,
  ...
}:

let
  paths = import ../../modules/paths.nix;
in

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    # (paths.core + "/boot.nix")
    # (paths.core + "/kernel.nix")
    # (paths.core + "/locale.nix")
    # (paths.core + "/network.nix")
    # (paths.core + "/timezone.nix")
    # (paths.core + "/nix.nix")
    # (paths.core + "/nix-ld.nix")
    (paths.core)
    (paths.gui + "/greetd.nix")
    (paths.gui + "/hyprland.nix")
    (paths.hardware + "/audio.nix")
    (paths.hardware + "/battery.nix")
    (paths.hardware + "/touchpad.nix")
    (paths.hardware + "/bluetooth.nix")
    (paths.scripts + "/autoupdate.nix")
    (paths.scripts + "/gc.nix")
    (paths.scripts + "/nh.nix")
    (paths.services + "/docker.nix")
    (paths.services + "/libvirt.nix")
    (paths.services + "/openssh.nix")
    (paths.users)
    (paths.env)

  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
