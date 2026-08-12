{ inputs, ... }: {
  flake.modules.homeManager.noctalia =
    {
      config,
      ...
    }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = {
          bar = {
            main = {
              enabled = true;
              thickness = 30;
              scale = 1.1000000089406967;
              margin_edge = 5;
              margin_ends = 10;
              start = [
                "workspaces"
                "spacer_3"
                "active_window"
              ];
              center = [
                "media"
                "spacer_2"
                "clock"
              ];
              end = [
                "clipboard"
                "battery"
                "bluetooth"
                "network"
                "volume"
                "session"
              ];
            };
          };

          control_center.shortcuts = [
            { type = "wifi"; }
            { type = "bluetooth"; }
            { type = "nightlight"; }
            { type = "notification"; }
            { type = "power_profile"; }
            { type = "weather"; }
          ];

          idle = {
            behavior_order = [
              "lock"
              "screen-off"
              "lock-and-suspend"
              "Hibernate"
            ];

            behavior = {
              lock = {
                action = "lock";
                enabled = true;
                timeout = 120.0; # 2 хв — швидше блокуємо, безпека понад усе на мобільному пристрої
              };
              screen-off = {
                action = "screen_off";
                enabled = true;
                timeout = 240.0; # 4 хв — гасимо екран швидко, головний споживач батареї
              };
              lock-and-suspend = {
                action = "lock_and_suspend";
                enabled = true;
                timeout = 600.0; # 10 хв — засинаємо значно швидше, ніж на десктопі
              };
              Hibernate = {
                action = "hibernate";
                command = "systemctl hibernate";
                enabled = true;
                timeout = 3600.0; # 60 хв — якщо довго без діла, у hibernate замість тримати suspend
              };
            };
          };

          location.auto_locate = true;

          shell = {
            screen_time_enabled = true;

            panel = {
              open_near_click_control_center = true;
              open_near_click_session = true;
              open_near_click_wallpaper = true;
            };

            session.actions = [
              {
                action = "logout";
                enabled = true;
                shortcut = "e";
                variant = "default";
                countdown_seconds = 0.0;
              }
              {
                action = "lock_and_suspend";
                enabled = true;
                shortcut = "l";
                variant = "default";
                countdown_seconds = 0.0;
              }
              {
                action = "reboot";
                enabled = true;
                shortcut = "r";
                variant = "default";
                countdown_seconds = 0.0;
              }
              {
                action = "shutdown";
                enabled = true;
                shortcut = "p";
                variant = "destructive";
                countdown_seconds = 0.0;
              }
              {
                action = "command";
                command = "systemctl hibernate";
                enabled = true;
                shortcut = "h";
                glyph = "hibernate";
                label = "Hibernate";
                variant = "default";
                countdown_seconds = 0.0;
              }
            ];
          };

          wallpaper = {
            directory = "/home/arfors/Pictures/Wallpapers";

            default.path = "/home/arfors/Pictures/Wallpapers/waterfall.png";
            last.path = "/home/arfors/Pictures/Wallpapers/waterfall.png";
          };
          shell = {
            avatar_path = "/home/arfors/flake/modules/profile/ava.jpg";
            panel.control_center_position = "center";
          };

          widget = {
            battery.show_label = false;
            network.show_label = false;
            volume.show_label = false;
            media.hide_when_no_media = true;
            clock.format = "{:%H:%M}";
            clock.anchor = true;
            spacer_2.type = "spacer";
            spacer_3 = {
              type = "spacer";
              length = 15;
            };
            workspaces = {
              capsule_radius = "auto";
              label_source = "none";
              show_labels = false;
              hide_when_empty = true;
            };
          };
        };
      };
    };
}
