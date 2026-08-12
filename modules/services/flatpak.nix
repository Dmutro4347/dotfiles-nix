# Flatpak applications configuration
{
  flake.modules.nixos.flatpak =
    {
      config,
      pkgs,
      inputs,
      ...
    }:

    {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];

      services.flatpak = {
        enable = true;
        packages = [
        ];
      };
    };
}
