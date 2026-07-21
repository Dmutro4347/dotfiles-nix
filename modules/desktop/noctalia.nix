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
          widget = {
            # Ліва частина — індикатор активного вікна (Spotify • назва треку)
            active_window = {
              type = "active_window";
              display = "icon_and_text";
              title_scroll = "on_hover";
              icon_size = 14;
            };

            # Центр — спектр + плеєр + кнопки
            audio-vis = {
              type = "audio_visualizer";
              width = 40;
              bands = 12;
              show_when_idle = false;
              color_1 = "primary";
              color_2 = "secondary";
            };

            media = {
              type = "media";
              album_art_only = false;
              hide_artist = false;
              artist_first = false;
              art_size = 18;
              title_scroll = "on_hover";
              hide_when_no_media = true;
              enable_scroll = true;
            };

            media-prev = {
              type = "custom_button";
              glyph = "player-skip-back";
              command = "playerctl previous";
            };
            media-playpause = {
              type = "custom_button";
              glyph = "player-play";
              command = "playerctl play-pause";
            };
            media-next = {
              type = "custom_button";
              glyph = "player-skip-forward";
              command = "playerctl next";
            };

            clock = {
              type = "clock";
              format = "{:%H:%M} • {:%a %d}"; # 13:12 • вт 21 (день тижня — з системної локалі)
            };

            # Права частина
            clipboard = {
              type = "clipboard";
            };

            cpu = {
              type = "sysmon";
              stat = "cpu_usage";
              display = "text";
            };

            battery = {
              type = "battery";
              device = "auto";
              display_mode = "icon";
              show_label = true;
            };

            network = {
              type = "network";
              show_label = false;
            };

            volume = {
              type = "volume";
              device = "output";
              show_label = false;
            };
          };

          bar.main = {
            position = "top";
            thickness = 34;

            start = [
              "workspaces"
              "active_window"
            ];

            center = [ "group:media-block" ];

            end = [
              "clipboard"
              "cpu"
              "battery"
              "network"
              "volume"
            ];

            capsule_group = [
              {
                id = "media-block";
                members = [
                  "audio-vis"
                  "media"
                  "media-prev"
                  "media-playpause"
                  "media-next"
                  "clock"
                ];
                fill = "surface_variant";
                radius = 8.0;
                padding = 6;
              }
            ];
          };

          widget.workspaces = {
            style = "regular";
            display = "none"; # без цифр, тільки пігулки-крапки — як на скріні
            active_pill_size = 2.2;
            inactive_pill_size = 1.0;
            focused_color = "primary";
            occupied_color = "secondary";
            empty_color = "surface_variant";
          };
        };
      };

    };
}
