{
  pkgs,
  stateVersion,
  hostname,
  ...
}:

let
  paths = ../../modules/paths.nix;
in

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
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

  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
