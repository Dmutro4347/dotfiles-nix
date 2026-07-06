{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        color = "rgba(235, 219, 178, 1.0)";
        position = "0, 300";
        halign = "center";
        walign = "center";

        shadow_passes = 1;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "250, 60";
          position = "0, -180";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          placeholder_text = "password baka";
          fail_text = "KURWA WRONG!!";
          shadow_passes = 1;
        }
      ];
      image = [
        {
          monitor = "";
          path = "$HOME/Pictures/ava.jpg";
          size = 200;
          halign = "center";
          walign = "center";
          border_size = 2;
          rounding = 100;
          position = "0, -20";

        }
      ];
    };
  };
}
