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
          bar.default = {
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
            "idle-behavior"
          ];

          behavior = {
            lock = {
              action = "lock";
              enabled = true; # ← увімкнено
              timeout = 60.0;
            };
            "screen-off" = {
              action = "screen_off";
              enabled = true; # ← увімкнено
              timeout = 660.0;
            };
            "lock-and-suspend" = {
              action = "lock_and_suspend";
              enabled = true; # ← увімкнено
              timeout = 900.0;
            };
            "idle-behavior" = {
              action = "command";
              enabled = false; # цей лишив вимкненим — не мав команди на скріні
              timeout = 600.0;
            };
          };
        };

        location.auto_locate = true;

        lockscreen.blurred_desktop = true;

        lockscreen_widgets = {
          enabled = true;
          schema_version = 2;
          widget_order = [ "lockscreen-login-box" ];

          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };

          widget."lockscreen-login-box" = {
            type = "login_box";
            box_width = 400.0;
            box_height = 70.0;
            cx = 960.0;
            cy = 960.0;
            rotation = 0.0;

            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              center_password_text = false;
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_password_hint = true;
            };
          };
        };

        shell = {
          screen_time_enabled = true;

          panel = {
            open_near_click_control_center = true;
            open_near_click_session = true;
            open_near_click_wallpaper = true;
          };

          session.actions = [
            {
              action = "lock";
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
          clock.format = "{:%H:%M}";
          clock.anchor = true;
          spacer_2.type = "spacer";
          spacer_3 = {
            type = "spacer";
            length = 15;
          };
          workspaces = {
            capsule_radius = "auto";
            hide_when_empty = true;
          };
        };
      };
    };
}
