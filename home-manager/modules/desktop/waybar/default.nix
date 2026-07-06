{ unstable, config, ... }: {
  programs.waybar = {
    enable = true;
    package = unstable.waybar;
    style = ./style.css; # Переконайся, що файл стилів лежить поруч
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        width = 1900;
        margin-top = 10;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "custom/cmus" "clock" ];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "battery"
          "network"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          tooltip = false;
        };

        "hyprland/window" = {
          format = "{class}";
          separate-outputs = false;
        };

        "custom/cmus" = {
          format = "{icon} {}";
          format-icons = { default = [ "<span color='#89b4fa'></span>" ]; };
          max-length = 45;
          interval = 1;
          exec = ''cmus-remote -C "format_print '%F'"'';
          exec-if = "pgrep cmus";
          on-click = "cmus-remote -u";
          on-scroll-up = "cmus-remote --next";
          on-scroll-down = "cmus-remote --prev";
          escape = true;
          tooltip = false;
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        "hyprland/language" = {
          format = "<span color='#fab387'>󰌏</span> {}";
          format-en = "EN";
          format-uk = "UA";
        };

        network = {
          "interval" = 10;
          "format" = "󰤨";
          "format-ethernet" = "󰈀";
          "format-wifi" = "{icon} {essid}";
          # "format-wifi" = "{icon}";
          "format-disconnected" = "󰤯";
          "format-disabled" = "󰤮";
          "format-icons" = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
          # "min-length" = 1;
          # "max-length" = 1;
          "on-click" = "kitty -e nmtui";
          "tooltip-format" = "<b>Gateway</b>: {gwaddr}";
          "tooltip-format-ethernet" = "<b>Interface</b>: {ifname}";
          "tooltip-format-wifi" = ''
            <b>Network</b>: {essid}
            <b>IP Addr</b>: {ipaddr}/{cidr}
            <b>Strength</b>: {signalStrength}%
            <b>Frequency</b>: {frequency} GHz'';
          "tooltip-format-disconnected" = "Wi-Fi Disconnected";
          "tooltip-format-disabled" = "Wi-Fi Disabled";
        };

        pulseaudio = {
          scroll-step = 5;
          format = "<span color='#fab387'>{icon}</span> {volume}%";
          format-icons = { default = [ "" " " " " ]; };
          on-click = "pavucontrol";
          tooltip = false;
        };

        clock = {
          format = "<span color='#cba6f7'></span> {:%H:%M}";
          tooltip-format = ''
            <big><span color='#cdd6f4'>{:%Y %B}</span></big>
            <tt><small>{calendar}</small></tt>'';
          format-alt =
            "<span color='#eba0ac'></span> <span color='#cdd6f4'>{:%d-%m-%Y}</span>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            # weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#cdd6f4'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#f5c2e7'><b>W{}</b></span>";
              weekdays = "<span color='#f5c2e7'><b>{}</b></span>";
              today = "<span color='#eba0ac'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "<span color='#a6e3a1'></span> {capacity}%";
        };

        "custom/power" = {
          format = "{icon}";
          format-icons = "";
          on-click = "wlogout";
          escape = true;
          tooltip = false;
        };
      };
    };
  };
}
