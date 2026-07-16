{
  flake.modules.homeManager.kitty = {
    programs.kitty = {
      enable = true;

      settings = {
        # background_opacity = lib.mkForce 0.87;
        hide_window_decorations = "yes";
        window_margin_width = lib.mkForce 15;

      };

    };
  };
}
