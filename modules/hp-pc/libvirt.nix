{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_full;
      swtpm.enable = true; # TPM 2.0 (для Win11, наприклад)
      ovmf.enable = true; # UEFI прошивка
    };
  };

  programs.virt-manager.enable = true; # GUI для керування
}
