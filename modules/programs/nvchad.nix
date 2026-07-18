# {
#   flake.modules.homeManager.nvchad =
#     {
#       config,
#       pkgs,
#       inputs,
#       ...
#     }:
#     {
#       # <-- inputs from flake
#       # ...
#       nixpkgs = {
#         overlays = [
#           (final: prev: {
#             nvchad = inputs.nix4nvchad.packages."${pkgs.system}".nvchad;
#           })
#         ];
#       };
#       imports = [
#         inputs.nix4nvchad.homeManagerModule
#       ];
#       programs.nvchad.enable = true;
#     };
# }

{
  # Оверлей винесено на рівень NixOS-системи, бо хост використовує
  # home-manager.useGlobalPkgs = true — тож home-manager і так бачить
  # той самий pkgs, а виставляти nixpkgs.overlays всередині home-manager
  # модуля при useGlobalPkgs=true офіційно deprecated.
  flake.modules.nixos.nvchad =
    { inputs, pkgs, ... }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          nvchad = inputs.nix4nvchad.packages.${pkgs.system}.default;
        })
      ];
    };

  flake.modules.homeManager.nvchad =
    { inputs, ... }:
    {
      imports = [
        inputs.nix4nvchad.homeManagerModules.default
      ];
      programs.nvchad.enable = true;
    };
}
