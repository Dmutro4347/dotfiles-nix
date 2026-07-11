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
          "com.google.AndroidStudio" # android studio
          "org.audacityteam.Audacity" # audacity
          "org.mozilla.firefox" # firefox
          "org.gimp.GIMP" # gimp
          "com.stremio.Stremio" # stremio
          "com.stremio.Service" # stremio service
        ];
      };
    };
}
