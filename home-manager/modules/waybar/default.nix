{ unstable, ... }:
{
  programs.waybar = {
    enable = true;
    package = unstable.waybar;
    style = ./style.css;
    settings = {
      mainBar = {
        height = 28;
        spacing = 0;
        position = "top";
        appearance = "dark";

        "modules-left" = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        "modules-center" = [
          "clock"
        ];
        "modules-right" = [
          "tray"
          "battery"
          "pulseaudio"
          "network"
          "hyprland/language"
        ];

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = [
            ""
            ""
          ];
          tooltip = true;
          "tooltip-format" = "{app}: {title}";
        };

        tray = {
          spacing = 10;
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "󰁿";
          "format-full" = "󱟢";
          "format-charging" = "󱟦";
          "format-plugged" = "{󰂄";
          "format-critical" = "󰂃";
        };

        pulseaudio = {
          tooltip = false;
          format = "{icon}";
          "format-muted" = "󰝟";
          "format-bluetooth" = "󰂰 {icon}";
          "format-bluetooth-muted" = "󰂰";
          "format-icons" = {
            headphones = "󰋋";
            headset = "󰋎";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          "on-click" = "pavucontrol";
        };

        backlight = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          "format-icons" = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        network = {
          "format-wifi" = "󰖩";
          "format-ethernet" = "󰈀";
          "format-linked" = "󰌷";
          "format-disconnected" = "󰖪";
          tooltip = false;
          "on-click" = "kitty nmtui";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
          "all-outputs" = false;
          "activate-only" = false;
          "format-icons" = {
            urgent = "";
            focused = "";
            active = "";
            default = "";
          };
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-uk = "UA";
          tooltip = false;
          # keyboard-name = "at-translated-set-2-keyboard";
        };

        clock = {
          format = "{:%R}";
          rotate = 0;
          "format-alt" = "{:%R 󰃭 %d·%m·%y}";
          "tooltip-format" = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
      };
    };
  };
}
