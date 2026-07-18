{
  flake.modules.nixos.dankshell =
    {
      inputs,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        # inputs.dms.homeModules.dank-material-shell
        inputs.dms-plugin-registry.nixosModules.default
        inputs.dms.nixosModules.default
        inputs.dms.nixosModules.greeter
      ];
      programs.dank-material-shell.greeter = {
        enable = true;
        compositor.name = "niri";
      };
      programs.dank-material-shell = {
        enable = true;
        # quickshell.package = pkgs.quickshell;
        # dgop.package = inputs.dgop.packages.${pkgs.system}.default;
        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
        };

        enableSystemMonitoring = true;
        plugins = {
          dankBatteryAlerts.enable = true;
          # dockerManager.enable = true;

          # Add plugin-specific settings
          mediaPlayer = {
            enable = false;

            # You can only define settings here if using the home-manager module
            settings = {
              preferredSource = "spotify";
            };

          };
        };
      };
      # додати в flake.modules.homeManager.dunkshell, поруч з programs.dank-material-shell
      # home.activation.makeDmsSettingsMutable = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      #   settingsFile="$HOME/.config/DankMaterialShell/settings.json"
      #   if [ -L "$settingsFile" ]; then
      #     target="$(readlink -f "$settingsFile" || true)"
      #     if [ -n "$target" ] && [ -f "$target" ]; then
      #       $DRY_RUN_CMD rm -f "$settingsFile"
      #       $DRY_RUN_CMD cp "$target" "$settingsFile"
      #     else
      #       $DRY_RUN_CMD rm -f "$settingsFile"
      #       $DRY_RUN_CMD sh -c "echo '{}' > '$settingsFile'"
      #     fi
      #     $DRY_RUN_CMD chmod u+w "$settingsFile"
      #   fi
      # '';
      #
    };
}
