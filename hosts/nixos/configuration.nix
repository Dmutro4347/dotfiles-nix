{
  pkgs,
  stateVersion,
  hostname,
  ...
}:

let
  modules = ../../modules;
in

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    (modules + "/audio.nix")
    (modules + "/boot.nix")
    (modules + "/env.nix")
    (modules + "/kernel.nix")
    (modules + "/network.nix")
    (modules + "/nix.nix")
    (modules + "/timezone.nix")
    (modules + "/user.nix")
    (modules + "/touchpad.nix")
    (modules + "/gc.nix")
    (modules + "/hyprland.nix")
    (modules + "/locale.nix")
    (modules + "/greetd.nix")
    (modules + "/nh.nix")
    (modules + "/docker.nix")
    (modules + "/libvirt.nix")
    (modules + "/nix-ld.nix")
    (modules + "/battery.nix")
    (modules + "/openssh.nix")
    (modules + "/bluetooth.nix")
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
