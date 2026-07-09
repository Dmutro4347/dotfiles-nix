{
  flake.modules.homeManager.dunkshell =
    {
      inputs,
      pkgs,
      unstable,
      ...
    }:
    {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.modules.default
      ];
      programs.dank-material-shell = {
        enable = true;
        quickshell.package = unstable.quickshell;
        dgop.package = inputs.dgop.packages.${pkgs.system}.default;

        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
        };

        # settings = {
        # theme = "dark";
        # enableSystemMonitoring = true;
        # enableDynamicTheming = true;
        # };

        plugins = {
          # Simply enable plugins by their ID (from the registry)
          # dankBatteryAlerts.enable = true;
          # dockerManager.enable = true;

          # Add plugin-specific settings
          mediaPlayer = {
            enable = true;

            # You can only define settings here if using the home-manager module
            settings = {
              preferredSource = "spotify";
            };
          };
        };
      };
    };
}
