{
  flake.modules.core.kernel =

    { pkgs, ... }: {
      boot.kernelPackages = pkgs.linuxPackages_zen;
    };
}
