{ inputs, ... }: {
  flake.modules.nixos.boot = { pkgs, ... }: {
    imports = [ inputs.minegrub-theme.nixosModules.default ];
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;

      minegrub-theme = {
        enable = true;
        splash = "100% Flakes!";
        background = "background_options/1.8  - [Classic Minecraft].png";
        boot-options-count = 4;
      };

    };

  };
}
