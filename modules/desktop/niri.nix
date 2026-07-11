{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.modules.nixos.niri = {
    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri.enable = true;

    # security.pam.services.swaylock = { };
  };

  flake.modules.homeManager.niri =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      # Конфіг у форматі KDL: https://kdl.dev
      # Тут — той самий дефолтний конфіг niri, перекладений у Nix-схему niri-flake.
      # Повна документація опцій: https://niri-wm.github.io/niri/Configuration:-Introduction
      programs.niri.settings = {
        # environment = {
        #   XDG_CURRENT_DESKTOP = "niri:GNOME";
        # };
        outputs = {
          # The regex below matches any connected monitor, replacing the empty leading comma
          "eDP-1" = {
            mode = {
              width = 1920;
              height = 1200;
              refresh = 60.0;
            };
            # 'auto' positioning is Niri's default layout behavior, so you don't need a position block
            scale = 1.0;
          };
        };

        # ---------------------------------------------------------------------
        # Налаштування пристроїв вводу.
        # https://niri-wm.github.io/niri/Configuration:-Input
        # ---------------------------------------------------------------------
        input = {
          keyboard = {
            xkb = {
              # Можна задати rules, model, layout, variant, options.
              # Наприклад:
              # layout = "us,ru";
              layout = "us,ua";
              options = "ctrl:nocaps, grp:alt_shift_toggle";
              #
              # Якщо секція порожня, niri візьме xkb-налаштування з
              # org.freedesktop.locale1 (керується через localectl set-x11-keymap).
            };
            # numlock = true;
          };

          # Налаштування touchpad через libinput.
          # Якщо опцію не задано — вона вимкнена або має дефолтне значення.
          # Все закоментоване нижче — приклади, а не дефолти.
          touchpad = {
            # enable = false;              # "off" у KDL — вимкнути touchpad повністю
            tap = true;
            # dwt = true;                  # disable-while-typing
            # dwtp = true;                 # disable-while-trackpointing
            # drag = false;
            # drag-lock = true;
            natural-scroll = true;
            # accel-speed = 0.2;
            # accel-profile = "flat";
            # scroll-method = "two-finger";
            # disabled-on-external-mouse = true;
          };

          mouse = {
            enable = true;
            # natural-scroll = true;
            # accel-speed = 0.2;
            # accel-profile = "flat";
            # scroll-method = "no-scroll";
          };

          trackpoint = {
            enable = true;
            # natural-scroll = true;
            # accel-speed = 0.2;
            # accel-profile = "flat";
            # scroll-method = "on-button-down";
            # scroll-button = 273;
            # scroll-button-lock = true;
            # middle-emulation = true;
          };

          # Розкоментуйте, щоб курсор стрибав у центр щойно сфокусованого вікна.
          # warp-mouse-to-focus = true;

          # Автоматично фокусувати вікна/виводи при наведенні миші.
          # max-scroll-amount="0%" — працює лише для вікон, які вже повністю на екрані.
          # focus-follows-mouse = {
          #   enable = true;
          #   max-scroll-amount = "0%";
          # };
        };

        # ---------------------------------------------------------------------
        # Налаштування виводів (моніторів) за їхнім іменем.
        # Дізнатись назву: `niri msg outputs` всередині сесії niri.
        # Вбудований екран ноутбука зазвичай називається "eDP-1".
        # https://niri-wm.github.io/niri/Configuration:-Outputs
        # Розкоментуйте і підставте свої значення:
        # ---------------------------------------------------------------------
        # outputs."eDP-1" = {
        #   enable = false;                 # "off" у KDL — вимкнути цей вивід
        #   mode = { width = 1920; height = 1080; refresh = 120.030; };
        #   scale = 2.0;
        #   transform = "normal";           # normal/90/180/270/flipped/flipped-90/flipped-180/flipped-270
        #   position = { x = 1280; y = 0; };
        # };

        # ---------------------------------------------------------------------
        # Налаштування розташування і розміру вікон.
        # https://niri-wm.github.io/niri/Configuration:-Layout
        # ---------------------------------------------------------------------
        layout = {
          gaps = 5;

          # Коли центрувати сфокусовану колонку:
          # "never" (дефолт) / "always" / "on-overflow"
          center-focused-column = "never";

          # Ширини, між якими перемикає "switch-preset-column-width" (Mod+R).
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            # { fixed = 1920; }   # можна задати фіксовану ширину в пікселях замість пропорції
          ];

          # Аналогічно для "switch-preset-window-height" (Mod+Ctrl+Shift+R).
          # preset-window-heights = [ ];

          # Ширина нових вікон за замовчуванням.
          default-column-width.proportion = 0.5;
          # default-column-width = { };   # порожньо — вікна самі вирішують початкову ширину

          # Кільце фокусу навколо активного вікна.
          focus-ring = {
            enable = false; # "off" у KDL — вимкнути кільце фокусу
            # width = 2;
            # active = "#7fc8ff";
            # inactive = "#505050";

            # Градієнти замість суцільного кольору (мають пріоритет над active-color):
            # active-gradient = { from = "#80c8ff"; to = "#c7ff7f"; angle = 45; };
            # inactive-gradient = {
            #   from = "#505050"; to = "#808080"; angle = 45;
            #   relative-to = "workspace-view";
            # };
            #   active.gradient = {
            #     from = "#d8dee8";
            #     to = "#afc8e9";
            #     angle = 45;
            #   };
            #   inactive.color = "#2f343f";
          };

          # Рамка навколо вікна — схожа на focus-ring, але завжди видима.
          # Якщо вмикаєте border, зазвичай варто вимкнути focus-ring.
          border = {
            enable = false;
            # width = 4;
            # active-color = "#ffc87f";
            # inactive-color = "#505050";
            # urgent-color = "#9b0000";

            # active-gradient = {
            #   from = "#e5989b"; to = "#ffb4a2"; angle = 45;
            #   relative-to = "workspace-view"; in = "oklch longer hue";
            # };
            # inactive-gradient = {
            #   from = "#505050"; to = "#808080"; angle = 45;
            #   relative-to = "workspace-view";
            # };
          };

          # Тіні від вікон.
          shadow = {
            enable = false; # "on" у KDL, тут навпаки: enable = true, щоб увімкнути

            # draw-behind-window = true;    # малювати тінь позаду вікна
            #                                # (корисно разом з prefer-no-csd і/або geometry-corner-radius,
            #                                # інакше можливі артефакти на заокруглених CSD-кутах)

            softness = 30;
            spread = 5;
            offset = {
              x = 0;
              y = 5;
            };
            color = "#0007";
          };

          # "Зовнішні" відступи, що зменшують робочу область (як і панелі layer-shell).
          struts = {
            left = 10;
            right = 10;
            top = 10;
            bottom = 10;
          };
        };

        # ---------------------------------------------------------------------
        # Процеси, що запускаються при старті.
        # Зверніть увагу: niri як сесія підтримує xdg-desktop-autostart,
        # що може бути зручнішим варіантом. Ще приклади — у секції binds.
        # ---------------------------------------------------------------------
        spawn-at-startup = [
          # { command = [ "dms run" ]; }
        ];

        # Для shell-команд (змінні, пайпи тощо) — spawn-sh-at-startup:
        # spawn-sh-at-startup = "qs -c ~/source/qs/MyAwesomeShell";

        hotkey-overlay = {
          # Розкоментуйте, щоб вимкнути спливаюче вікно "Important Hotkeys" при старті.
          skip-at-startup = true;
        };

        # Просити клієнтів прибирати власні (client-side) декорації, де можливо.
        # Якщо клієнт явно просить CSD — запит буде задоволено.
        # Також повідомляє клієнтам, що вони "tiled", що прибирає деякі
        # клієнтські заокруглені кути. Виправляє малювання рамки/кільця фокусу
        # позаду напівпрозорих вікон.
        # Після вмикання/вимикання треба перезапустити застосунки.
        prefer-no-csd = true;

        # Шлях, куди зберігати скріншоти. "~" на початку розгортається в home.
        # Шлях форматується через strftime(3) — дата й час скріншоту.
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
        # screenshot-path = null;   # вимкнути збереження скріншотів на диск

        # ---------------------------------------------------------------------
        # Налаштування анімацій.
        # https://niri-wm.github.io/niri/Configuration:-Animations
        # ---------------------------------------------------------------------
        animations = {
          enable = true; # "off" у KDL — вимкнути всі анімації
          # slowdown = 3.0;    # уповільнити всі анімації (значення < 1 — прискорює)
        };

        # ---------------------------------------------------------------------
        # Правила для окремих вікон.
        # https://niri-wm.github.io/niri/Configuration:-Window-Rules
        # ---------------------------------------------------------------------
        window-rules = [

          {
            geometry-corner-radius = {
              top-left = 15.0;
              top-right = 15.0;
              bottom-left = 15.0;
              bottom-right = 15.0;

            };
            clip-to-geometry = true;
            draw-border-with-background = false;
          }

          {
            matches = [ { app-id = "org.telegram.desktop"; } ];
            open-on-workspace = "2";
          }
          {
            matches = [ { app-id = "jetbrains-pycharm"; } ];
            open-on-workspace = "3";
          }
          {
            matches = [ { app-id = "Spotify"; } ];
            open-on-workspace = "4";
          }
          {
            matches = [ { app-id = "obsidian"; } ];
            open-on-workspace = "5";
          }
          {
            matches = [ { app-id = "firefox"; } ];
            open-on-workspace = "9";
          }

          # float, class:(org.pulseaudio.pavucontrol)|(.blueman-manager-wrapped)|(LM Studio)
          {
            matches = [
              { app-id = "LM Studio"; }
            ];
            open-floating = true;
          }

          # size 1000 1000, class:(org.pulseaudio.pavucontrol)
          # {
          #   matches = [ { app-id = "org.pulseaudio.pavucontrol"; } ];
          #   default-window-height = {
          #     fixed = 1000;
          #   };
          #   # ширину (1000) окремим правилом задати наразі не вдалось перекласти
          # напевно — див. примітку нижче

          # float, class:(org.quickshell)
          {
            matches = [ { app-id = "dev.noctalia.Noctalia"; } ];
            open-floating = true;
          }
          # Обхід бага WezTerm при початковому конфігуруванні розміру.
          # Регулярка навмисно максимально специфічна (це дефолтний конфіг,
          # хочемо уникнути хибних співпадінь) — досить і app-id="wezterm".

          # {
          #   matches = [ { app-id = "^org\\.wezfurlong\\.wezterm$"; } ];
          #   default-column-width = { };
          # }
          #
          # Плаваючий Firefox picture-in-picture за замовчуванням.
          # Регулярка підходить і для host-Firefox (app-id "firefox"),
          # і для Flatpak-Firefox (app-id "org.mozilla.firefox").
          # {
          #   matches = [
          #     {
          #       app-id = "firefox$";
          #       title = "^Picture-in-Picture$";
          #     }
          #   ];
          #   open-floating = true;
          # }

          # Приклад: приховати два менеджери паролів від захоплення екрана.
          # {
          #   matches = [
          #     { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
          #     { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
          #   ];
          #   block-out-from = "screen-capture";
          #   # block-out-from = "screencast";  # лишити видимим для сторонніх засобів запису
          # }

          # Приклад: заокруглені кути для всіх вікон.
          # {
          #   geometry-corner-radius = {
          #     top-left = 12.0;
          #     top-right = 12.0;
          #     bottom-left = 12.0;
          #     bottom-right = 12.0;
          #   };
          #   clip-to-geometry = true;
          # }
        ];
        workspaces = {
          "1" = { };
          "2" = { };
          "3" = { };
          "4" = { };
          "5" = { };
          "6" = { };
          "7" = { };
          "8" = { };
          "9" = { };
        };
        # ---------------------------------------------------------------------
        # Гарячі клавіші.
        # https://niri-wm.github.io/niri/Configuration:-Key-Bindings
        # ---------------------------------------------------------------------
        binds = with config.lib.niri.actions; {

          # Mod-Shift-/ (зазвичай те саме, що Mod-?) — показує список гарячих клавіш.
          "Mod+Shift+Slash".action = show-hotkey-overlay;

          # Рекомендовані біндинги для запуску програм: термінал, лончер, блокування екрана.
          "Mod+Shift+Return" = {
            # hotkey-overlay = "Open a Terminal: kitty";
            action.spawn = "kitty";
          };
          "Mod+Shift+D" = {
            # hotkey-overlay = "Run an Application: wofi";
            action = spawn-sh "noctalia msg panel-toggle launcher";
          };
          "Mod+N" = {
            # description = "Open notifications";
            action = spawn-sh "noctalia msg notification-invoke-latest";
          };

          # "Mod+V" = {
          #   hotkey-overlay = "Toggle clipboard";
          #   action = {
          #     spawn = [
          #       "dms"
          #       "ipc"
          #       "call"
          #       "clipboard"
          #       "toggle"
          #     ];
          #   };
          # };

          "Mod+Shift+B" = {
            # description = "Open Browser";
            action = {
              # Заміни "firefox" на свій браузер, якщо у тебе інший (наприклад, "chromium" або "brave")
              spawn = [ "firefox" ];
            };
          };

          "Mod+Shift+T" = {
            # description = "Open Messenger";
            action = {
              # Заміни на свій месенджер (наприклад, "telegram-desktop", "discord" тощо)
              spawn = [ "Telegram" ];
            };
          };
          # "Super+Alt+L" = {
          #   # description = "Lock the Screen: swaylock";
          #   action.spawn = "swaylock";
          # };
          #
          # spawn-sh — для shell-команд (пайпи, декілька команд і т.д.).
          # Увесь рядок передається як один аргумент, буквально в `sh -c`.
          # Приклад: стандартний біндинг перемикання читання екрана (orca).
          "Super+Alt+S" = {
            allow-when-locked = true;
            # hotkey-overlay-title = null;
            action = spawn-sh "pkill orca || exec orca";
          };

          # Гучність через PipeWire/WirePlumber.
          # allow-when-locked=true — працює навіть коли сесія заблокована.
          # "-l 1.0" обмежує гучність до 100%.
          "XF86AudioRaiseVolume" = {
            allow-when-locked = true;
            action = spawn-sh "noctalia msg volume-up";
          };
          "XF86AudioLowerVolume" = {
            allow-when-locked = true;
            action = spawn-sh "noctalia msg volume-down";
          };
          "XF86AudioMute" = {
            allow-when-locked = true;
            action = spawn-sh "noctalia msg volume-mute";
          };
          "XF86AudioMicMute" = {
            allow-when-locked = true;
            action = spawn-sh "noctalia msg mic-mute";
          };

          # Медіаклавіші через playerctl — працює з будь-яким MPRIS-плеєром.
          "XF86AudioPlay" = {
            allow-when-locked = true;
            action = spawn-sh "playerctl play-pause";
          };
          "XF86AudioStop" = {
            allow-when-locked = true;
            action = spawn-sh "playerctl stop";
          };
          "XF86AudioPrev" = {
            allow-when-locked = true;
            action = spawn-sh "playerctl previous";
          };
          "XF86AudioNext" = {
            allow-when-locked = true;
            action = spawn-sh "playerctl next";
          };

          # Яскравість через brightnessctl.
          "XF86MonBrightnessUp" = {
            allow-when-locked = true;

            action = spawn-sh "noctalia msg brightness-up";
          };
          "XF86MonBrightnessDown" = {
            allow-when-locked = true;
            action = spawn-sh "noctalia msg brightness-down";
          };

          # Overview — огляд усіх робочих просторів і вікон.
          # Також відкривається наведенням миші у верхній лівий кут
          # або свайпом чотирма пальцями вгору на тачпаді.
          "Mod+O".repeat = false;
          "Mod+O".action = toggle-overview;

          "Mod+Shift+Q" = {
            repeat = false;
            action = close-window;
          };

          "Mod+Left".action = focus-column-left;
          "Mod+Down".action = focus-window-down;
          "Mod+Up".action = focus-window-up;
          "Mod+Right".action = focus-column-right;
          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-down;
          "Mod+K".action = focus-window-up;
          "Mod+L".action = focus-column-right;

          "Mod+Shift+Left".action = move-column-left;
          "Mod+Shift+Down".action = move-window-down;
          "Mod+Shift+Up".action = move-window-up;
          "Mod+Shift+Right".action = move-column-right;
          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+J".action = move-window-down;
          "Mod+Shift+K".action = move-window-up;
          "Mod+Shift+L".action = move-column-right;

          # Альтернатива: переходити між робочими просторами, дійшовши
          # до першого/останнього вікна в колонці.
          # "Mod+J".action = focus-window-or-workspace-down;
          # "Mod+K".action = focus-window-or-workspace-up;
          # "Mod+Ctrl+J".action = move-window-down-or-to-workspace-down;
          # "Mod+Ctrl+K".action = move-window-up-or-to-workspace-up;

          "Mod+Home".action = focus-column-first;
          "Mod+End".action = focus-column-last;
          "Mod+Ctrl+Home".action = move-column-to-first;
          "Mod+Ctrl+End".action = move-column-to-last;

          # "Mod+Shift+Left".action = focus-monitor-left;
          # "Mod+Shift+Down".action = focus-monitor-down;
          # "Mod+Shift+Up".action = focus-monitor-up;
          # "Mod+Shift+Right".action = focus-monitor-right;
          # "Mod+Shift+H".action = focus-monitor-left;
          # "Mod+Shift+J".action = focus-monitor-down;
          # "Mod+Shift+K".action = focus-monitor-up;
          # "Mod+Shift+L".action = focus-monitor-right;
          #
          # "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
          # "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
          # "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
          # "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
          # "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
          # "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
          # "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
          # "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;
          #
          # Альтернативи: рухати лише одне вікно між моніторами:
          # "Mod+Shift+Ctrl+Left".action = move-window-to-monitor-left;
          # ...
          # Або рухати весь робочий простір на інший монітор:
          # "Mod+Shift+Ctrl+Left".action = move-workspace-to-monitor-left;
          # ...

          "Mod+Page_Down".action = focus-workspace-down;
          "Mod+Page_Up".action = focus-workspace-up;
          "Mod+U".action = focus-workspace-down;
          "Mod+I".action = focus-workspace-up;
          "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
          "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
          "Mod+Ctrl+U".action = move-column-to-workspace-down;
          "Mod+Ctrl+I".action = move-column-to-workspace-up;

          # Альтернатива: рухати лише одне вікно:
          # "Mod+Ctrl+Page_Down".action = move-window-to-workspace-down;
          # ...

          "Mod+Shift+Page_Down".action = move-workspace-down;
          "Mod+Shift+Page_Up".action = move-workspace-up;
          "Mod+Shift+U".action = move-workspace-down;
          "Mod+Shift+I".action = move-workspace-up;

          # Прокрутка колесом миші. cooldown-ms обмежує частоту спрацювання —
          # корисно, щоб не "проскролити" забагато робочих просторів одразу.
          # cooldown-ms можна задавати для будь-якого біндингу, але найкорисніший
          # він саме для колеса.
          "Mod+WheelScrollDown" = {
            cooldown-ms = 150;
            action = focus-workspace-down;
          };
          "Mod+WheelScrollUp" = {
            cooldown-ms = 150;
            action = focus-workspace-up;
          };
          "Mod+Ctrl+WheelScrollDown" = {
            cooldown-ms = 150;
            action = move-column-to-workspace-down;
          };
          "Mod+Ctrl+WheelScrollUp" = {
            cooldown-ms = 150;
            action = move-column-to-workspace-up;
          };

          "Mod+WheelScrollRight".action = focus-column-right;
          "Mod+WheelScrollLeft".action = focus-column-left;
          "Mod+Ctrl+WheelScrollRight".action = move-column-right;
          "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

          # Зазвичай прокрутка вгору/вниз з Shift дає горизонтальну прокрутку —
          # ці біндинги відтворюють це.
          "Mod+Shift+WheelScrollDown".action = focus-column-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-left;
          "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
          "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

          # Так само можна біндити "тіки" прокрутки тачпада. Прокрутка тачпада
          # неперервна, тому для цих біндингів вона ділиться на дискретні інтервали.
          # Ці приклади "інвертовані", бо natural-scroll для тачпада увімкнено
          # за замовчуванням.
          # "Mod+TouchpadScrollDown".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+";
          # "Mod+TouchpadScrollUp".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-";

          # niri — динамічна система робочих просторів, тож звернення за
          # індексом — це "best effort". Індекс більший за поточну кількість
          # просторів вкаже на найнижчий (порожній) простір.
          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;
          "Mod+Shift+1".action.move-column-to-workspace = [ 1 ];
          "Mod+Shift+2".action.move-column-to-workspace = [ 2 ];
          "Mod+Shift+3".action.move-column-to-workspace = [ 3 ];
          "Mod+Shift+4".action.move-column-to-workspace = [ 4 ];
          "Mod+Shift+5".action.move-column-to-workspace = [ 5 ];
          "Mod+Shift+6".action.move-column-to-workspace = [ 6 ];
          "Mod+Shift+7".action.move-column-to-workspace = [ 7 ];
          "Mod+Shift+8".action.move-column-to-workspace = [ 8 ];
          "Mod+Shift+9".action.move-column-to-workspace = [ 9 ];

          # Альтернатива: рухати лише одне вікно:
          # "Mod+Ctrl+1".action.move-window-to-workspace = [ 1 ];

          # Перемикання фокусу між поточним і попереднім робочим простором.
          # "Mod+Tab".action = focus-workspace-previous;

          # Ці біндинги рухають сфокусоване вікно всередину/назовні колонки.
          # Якщо вікно самотнє — його "поглинає" сусідня колонка з відповідного боку.
          # Якщо вікно вже в колонці — його "виштовхує" назовні.
          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;

          # Поглинути одне вікно справа в низ сфокусованої колонки.
          "Mod+Comma".action = consume-window-into-column;
          # Виштовхнути нижнє вікно з колонки праворуч.
          "Mod+Period".action = expel-window-from-column;

          # Циклічний перебір ширин з preset-column-widths.
          "Mod+R".action = switch-preset-column-width;
          # Той самий перебір, але у зворотному порядку.
          "Mod+Shift+R".action = switch-preset-column-width-back;

          "Mod+Ctrl+Shift+R".action = switch-preset-window-height;
          "Mod+Ctrl+R".action = reset-window-height;

          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;

          # На відміну від maximize-column (лишає gaps/рамки), maximize-window-to-edges
          # розтягує вікно до країв екрана — як звичайне подвійне клацання на тайтлбарі.
          "Mod+M".action = fullscreen-window;

          # Розширити сфокусовану колонку на весь вільний простір,
          # не зайнятий іншими повністю видимими колонками.
          "Mod+Ctrl+F".action = expand-column-to-available-width;

          "Mod+C".action = center-column;
          # Центрувати всі повністю видимі колонки на екрані.
          "Mod+Ctrl+C".action = center-visible-columns;

          # Точніша зміна ширини. Значення можуть бути:
          # * абсолютні пікселі: "1000"
          # * зміна в пікселях: "-5" або "+5"
          # * відсоток ширини екрана: "25%"
          # * зміна у відсотках: "-10%" або "+10%"
          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";

          # Точніша зміна висоти, коли вікно в колонці з іншими.
          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";

          # Перемкнути сфокусоване вікно між плаваючим і тайловим режимом.
          "Mod+V".action = toggle-window-floating;
          "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

          # Перемкнути відображення колонки як вкладок (табів) —
          # вікна показуються вертикальними табами замість стеку.
          "Mod+W".action = toggle-column-tabbed-display;

          # Перемикання розкладки клавіатури.
          # Якщо розкоментуєте — переконайтесь, що НЕ задали той самий
          # хоткей у xkb options вище: інакше перемикання зламається,
          # бо спрацює двічі (раз через xkb, раз через niri).
          # "Mod+Space".action = switch-layout "next";
          # "Mod+Shift+Space".action = switch-layout "prev";

          "Print".action = {
            screenshot = [ ];
          };
          "Ctrl+Print".action = {
            screenshot-screen = [ ];
          };
          "Alt+Print".action = {
            screenshot-window = [ ];
          }; # доступно з niri 25.02+;
          #                                           # розкоментуйте, коли оновите пакет niri

          # Клієнти на кшталт remote-desktop або програмних KVM-перемикачів
          # можуть попросити niri тимчасово не обробляти ці гарячі клавіші,
          # щоб пересилати натискання як є на віддалену машину.
          # Варто забіндити цю "аварійну кнопку", щоб глючний застосунок
          # не міг утримати вашу сесію заручником.
          #
          # Властивість allow-inhibiting=false можна застосувати й до інших
          # біндингів — тоді niri завжди їх оброблятиме, навіть коли inhibitor активний.
          "Mod+Escape" = {
            allow-inhibiting = false;
            action = toggle-keyboard-shortcuts-inhibit;
          };

          # Дія quit показує діалог підтвердження, щоб уникнути випадкового виходу.
          "Mod+Shift+E".action = spawn-sh "noctalia msg panel-toggle session";
          # "Mod".action = quit;

          # Вимикає монітори. Щоб увімкнути назад — будь-яке введення
          # (рух миші чи натискання будь-якої іншої клавіші).
          # "Mod+Shift+P".action = power-off-monitors;
        };
      };
    };
}
