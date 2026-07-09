{ config, pkgs, inputs, ... }: {  # <-- inputs from flake
  # ...
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nix4nvchad.packages."${pkgs.system}".nvchad;
      })
    ];
  };
    imports = [
    inputs.nix4nvchad.homeManagerModule
  ];
  programs.nvchad.enable = true;
}
