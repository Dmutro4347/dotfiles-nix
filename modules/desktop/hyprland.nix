{
  flake.modules.nixos.hyprland = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      # xwayland.enable = false;
    };
  };

  flake.modules.homeManager.hyprland = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = [ pkgs.hyprlandPlugins.hyprsplit ];
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
        monitor = ",1920x1200@60,auto,1";
        "$mainMod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "$terminal -e sh -c 'ranger'";
        "$menu" = "wofi";
        "$browser" = "firefox";
        "$massanger" = "Telegram";

        exec-once = [
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
            size = 4;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true;
          bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
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
          # workspace_swipe = false;
          # workspace_swipe_invert = false;
          # workspace_swipe_forever = true;
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
          # "workspace 5,class:(obsidian)"
          # "workspace 2,class:(org.telegram.desktop)"
          # "workspace 9,class:(firefox)"
          # "workspace 4,class:(Spotify)"
          # "workspace 3, class:(jetbrains-pycharm)"
          # "workspace 7, class:(info.febvre.Komikku)"
          "float,class:(org.pulseaudio.pavucontrol)|(.blueman-manager-wrapped)|(LM Studio)"
          "size 1000 1000,class:(org.pulseaudio.pavucontrol)"
          "float,class:(org.quickshell)"
        ];

        # workspace = [
        #   "w[tv1], gapsout:0, gapsin:0"
        #   "f[1], gapsout:0, gapsin:0"
        # ];

        # --- бінди (раніше binds.nix) ---
        bind = [
          "$mainMod SHIFT, Return, exec, $terminal"
          "$mainMod SHIFT, Q, killactive,"
          "$mainMod SHIFT, E, exec, dms ipc call powermenu toggle"
          "$mainMod SHIFT, B, exec, $browser"
          "$mainMod SHIFT, T, exec, $massanger"
          "$mainMod SHIFT, W, exec, waypaper"
          "$mainMod,       F, togglefloating,"
          "$mainMod SHIFT, R, exec, dms ipc call spotlight toggle"
          "$mainMod,       P, pseudo,"
          "$mainMod,       T, togglesplit,"
          "$mainMod,       N, exec, dms ipc call notifications open"
          "$mainMod,       V, exec, dms ipc call clipboard toggle"
          ", Print, exec, grimblast --notify --freeze copysave area"

          # Moving focus
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          # Moving windows
          "$mainMod SHIFT, left,  movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up,    movewindow, u"
          "$mainMod SHIFT, down,  movewindow, d"
          "$mainMod SHIFT, h, movewindow, l"
          "$mainMod SHIFT, l, movewindow, r"
          "$mainMod SHIFT, k, movewindow, u"
          "$mainMod SHIFT, j, movewindow, d"

          # Resizeing windows                   X  Y
          "$mainMod CTRL, left,  resizeactive, -50 0"
          "$mainMod CTRL, right, resizeactive,  50 0"
          "$mainMod CTRL, up,    resizeactive,  0 -50"
          "$mainMod CTRL, down,  resizeactive,  0  50"
          "$mainMod CTRL, H, resizeactive,-50 0"
          "$mainMod CTRL, L, resizeactive,50 0"
          "$mainMod CTRL, K, resizeactive,0 -50"
          "$mainMod CTRL, J, resizeactive,0 50"

          # Switching workspaces
          "$mainMod, 1, split:workspace, 1"
          "$mainMod, 2, split:workspace, 2"
          "$mainMod, 3, split:workspace, 3"
          "$mainMod, 4, split:workspace, 4"
          "$mainMod, 5, split:workspace, 5"
          "$mainMod, 6, split:workspace, 6"
          "$mainMod, 7, split:workspace, 7"
          "$mainMod, 8, split:workspace, 8"
          "$mainMod, 9, split:workspace, 9"
          "$mainMod, 0, split:workspace, 10"

          # Moving windows to workspaces
          "$mainMod SHIFT, 1, split:movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, split:movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, split:movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, split:movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, split:movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, split:movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, split:movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, split:movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, split:movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, split:movetoworkspacesilent, 10"

          # Scratchpad
          "$mainMod,       S, togglespecialworkspace,  magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
        ];

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        # Laptop multimedia keys for volume and LCD brightness
        bindel = [
          ",XF86AudioRaiseVolume,  exec, dms ipc call audio increment 5"
          ",XF86AudioLowerVolume,  exec, dms ipc call audio decrement 5"
          ",XF86AudioMute,         exec, dms ipc call audio mute"
          ",XF86AudioMicMute,      exec, dms ipc call audio micmute"
          ",XF86MonBrightnessUp, exec, dms ipc call brightness increment 10 ''"
          ",XF86MonBrightnessDown, exec, dms ipc call brightness decrement 10 ''"
        ];

        # Audio playback
        bindl = [
          ", XF86AudioNext,  exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay,  exec, playerctl play-pause"
          ", XF86AudioPrev,  exec, playerctl previous"
        ];
      };
    };
  };
}
