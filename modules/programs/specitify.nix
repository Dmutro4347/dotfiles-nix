{ inputs, ... }:
{
  flake.modules.nixos.spicetify =
    { pkgs, ... }:
    {
      imports = [
        inputs.spicetify-nix.nixosModules.spicetify
      ];
      programs.spicetify =
        let
          spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
        {
          enable = true;
          wayland = true;
          theme = spicePkgs.themes.catppuccin;
          colorScheme = "mocha";
          enabledExtensions = with spicePkgs.extensions; [
            adblockify
            # hidePodcasts
            shuffle # shuffle+ (special characters are sanitized out of extension names)
          ];
        };
    };
}
