{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  flake.modules.homeManager.dankshell =
    {
      inputs,
      lib,
      config,
      pkgs,
      ...
    }:
    let
      dmsSettingsDefault = pkgs.writeText "dms-settings-default.json" (
        builtins.toJSON {
          # твої дефолтні DMS-налаштування тут
        }
      );
    in
    {
      imports = [
        # inputs.niri.homeModules.niri
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
      ];

      programs.dank-material-shell = {
        enable = true;

        systemd = {
          enable = true;
          restartIfChanged = true;
        };

        enableSystemMonitoring = true;

        plugins = {
          # dankBatteryAlerts.enable = true;
          mediaPlayer = {
            enable = false;
            settings = {
              preferredSource = "spotify";
            };
          };
        };

        niri.includes = {
          enable = true;
          override = true;
          originalFileName = "hm";
          filesToInclude = [
            "binds"
            "outputs"
            "wpblur"
          ];
        };
      };

      home.activation.dmsSettingsSeed = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        target="$HOME/.config/dms/settings.json"

        if [ ! -e "$target" ] || [ -L "$target" ]; then
          mkdir -p "$(dirname "$target")"
          rm -f "$target"
          cp ${dmsSettingsDefault} "$target"
          chmod u+w "$target"
          $DRY_RUN_CMD echo "DMS settings.json seeded as mutable file"
        fi
      '';
    };
}
