{
  flake.modules.nixos.users = { pkgs, config, ... }: {
    programs.fish.enable = true;

    users = {
      defaultUserShell = pkgs.fish;
      users.${config.primaryUser} = {
        isNormalUser = true;

        # image = "/home/${config.primaryUser}/Pictures/ava.jpg";
        extraGroups = [
          "wheel"
          "networkmanager"
          "input"
          "docker"
          "dockerd"
          "kvm"
          "libvirtd"
          "i2c"
        ];
      };

    };
    system.activationScripts.setUserAvatar.text = ''
      mkdir -p /var/lib/AccountsService/{icons,users}
      install -m644 ${config.profile.avatar} "/var/lib/AccountsService/icons/${config.primaryUser}"

      touch "/var/lib/AccountsService/users/${config.primaryUser}"
      ${pkgs.crudini}/bin/crudini --set \
        "/var/lib/AccountsService/users/${config.primaryUser}" \
        User Icon "/var/lib/AccountsService/icons/${config.primaryUser}"
    '';
  };
}
