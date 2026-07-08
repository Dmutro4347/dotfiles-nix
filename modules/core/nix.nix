{
  flake.modules.core.nix = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nix.settings.flake-registry = "";
  };
}
