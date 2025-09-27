{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];
    extraConfig = ''
      plugin {
        hyprsplit {
          num_workspaces = 10
        }
      }
    '';
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "XCURSOR_THEME,DMZ-Black"
        "XCURSOR_SIZE,24"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/screens"

      ];
      monitor = ",1920x1080@60,auto,1";
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "$terminal -e sh -c 'ranger'";
      "$menu" = "wofi";
      "$browser" = "firefox";
      "$massanger" = "telegram-desktop";

      exec-once = [
        "waypaper --restore"
        "blueman-applet"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 0;

        "col.active_border" = "rgba(d8dee8ff) rgba(afc8e9ff) 45deg";
        "col.inactive_border" = "rgba(2f343fff)";

        resize_on_border = false;

        allow_tearing = false;
        layout = "dwindle";
        no_border_on_floating = true;
      };

      decoration = {
        rounding = 15;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        blur = {
          enabled = true;

          size = 10;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      input = {
        kb_layout = "us,ua";
        kb_options = "ctrl:nocaps, grp:alt_shift_toggle";
        follow_mouse = 1;

        sensitivity = 0;
      };

      gestures = {
        workspace_swipe = false;
        #workspace_swipe_invert = false;
        #workspace_swipe_forever	= true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      windowrulev2 = [
        "workspace 5,class:(obsidian)"
        "workspace 2,class:(org.telegram.desktop)"
        "workspace 9,class:(firefox)"
        "workspace 4,class:(Spotify)"
        "workspace 3, class:(jetbrains-pycharm)"
        "float,class:(org.pulseaudio.pavucontrol)|(.blueman-manager-wrapped)|(waypaper)"
        "size 1000 1000,class:(org.pulseaudio.pavucontrol)"
      ];

      #      workspace = [
      #      "w[tv1], gapsout:0, gapsin:0"
      #        "f[1], gapsout:0, gapsin:0"
      #      ];
    };
  };
}
