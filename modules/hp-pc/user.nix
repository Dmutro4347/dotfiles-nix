{ pkgs, user, ... }:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.arfors = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "input"
        "docker"
        "dockerd"
        "kvm"
        "libvirtd"
      ];
    };
  };
}
