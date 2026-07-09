{
  flake.modules.nixos.users = { pkgs, config, ... }: {
    programs.zsh.enable = true;

    users = {
      defaultUserShell = pkgs.zsh;
      users.${config.primaryUser} = {
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
  };
}
