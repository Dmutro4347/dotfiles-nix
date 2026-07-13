{
  flake.modules.nixos.libvirt = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.spice-gtk
      pkgs.spice-protocol
      pkgs.usbredir
    ];
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        swtpm.enable = true; # TPM 2.0 (для Win11, наприклад)
      };
    };

    programs.virt-manager.enable = true; # GUI для керування
    services.spice-vdagentd.enable = true;
    security.polkit.enable = true;
  };
}
